package main

import (
	"database/sql"
	"fmt"
	"os"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/labstack/echo/v4"
	_ "github.com/lib/pq"
	"github.com/twilio/twilio-go"
	controller "github.com/umitbasakk/humanComputerInteractionBackend/UserStore/Controller"
	"github.com/umitbasakk/humanComputerInteractionBackend/UserStore/database"
	"github.com/umitbasakk/humanComputerInteractionBackend/UserStore/middlewares"
	"github.com/umitbasakk/humanComputerInteractionBackend/UserStore/service"
)

func main() {
	echoContext := echo.New()
	psqlInfo := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable", os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_NAME"))
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	defer db.Close()

	files, err := os.ReadDir("./migrations")
	if err != nil {
		fmt.Println("Hata:", err)
		return
	}

	// Dosyaları listele
	fmt.Println("Dizindeki dosyalar:")
	for _, file := range files {
		fmt.Println(file.Name())
	}

	if err != nil {
		fmt.Println("Hata:", err)
		return
	}

	m, err := migrate.New(
		"file://./migrations",
		psqlInfo)
	if err != nil {
		fmt.Println(err)
	}
	m.Down()
	if err := m.Up(); err != nil {
		fmt.Println(err)
	}

	appMiddleware := &middlewares.AppMiddleware{
		Logger: echoContext.Logger,
		DB:     db,
	}

	client := twilio.NewRestClientWithParams(twilio.ClientParams{
		Username: os.Getenv("TWILIO_USERNAME"), //AC7ed880bbbac683e5c3ff3b553631be20
		Password: os.Getenv("TWILIO_PASSWORD"), // c049546a99d30d5e0db61ba98f7dff9a
	})

	userDataLayer := database.NewUserDatalayerImpl(db)
	userService := service.NewUserServiceImpl(userDataLayer, client)
	controller.NewUserController(echoContext, userService, appMiddleware)

	aiDataLayer := database.NewAIDataLayerImpl(db)
	aiService := service.NewAIServiceImpl(aiDataLayer)
	controller.NewAIController(echoContext, aiService, appMiddleware)

	echoContext.Logger.Fatal(echoContext.Start(":1323"))
}
