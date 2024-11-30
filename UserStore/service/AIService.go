package service

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"time"

	"github.com/labstack/echo/v4"
	AIModel "github.com/umitbasakk/humanComputerInteractionBackend/UserStore/model/AI"
	AuthModel "github.com/umitbasakk/humanComputerInteractionBackend/UserStore/model/Auth"
	model "github.com/umitbasakk/humanComputerInteractionBackend/UserStore/model/Auth"

	"github.com/umitbasakk/humanComputerInteractionBackend/interfaces"
)

type AIServiceImpl struct {
	aiDL interfaces.AIDataLayer
}

func NewAIServiceImpl(dataLayer interfaces.AIDataLayer) interfaces.AIService {
	return &AIServiceImpl{
		aiDL: dataLayer,
	}
}

func (AIService *AIServiceImpl) GetResult(context context.Context, ctx echo.Context, request *AIModel.AIRequest, user *AuthModel.User) error {

	gfile, err := ctx.FormFile("image")
	file, err := gfile.Open()
	if err != nil {
		return ctx.JSON(http.StatusUnauthorized, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}
	savePath := fmt.Sprintf("./uploads/%s", gfile.Filename)
	absolutePath, _ := filepath.Abs(savePath)
	fmt.Println("Error:", absolutePath)

	dst, err := os.Create(savePath)
	if err != nil {
		return ctx.JSON(http.StatusUnauthorized, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}
	defer dst.Close()

	_, err = io.Copy(dst, file)

	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}
	data := map[string]string{"url": savePath}
	jsonData, err := json.Marshal(data)

	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}

	url := "http://host.docker.internal:5000/receiverImage"

	client := &http.Client{
		Timeout: 5 * time.Second,
	}
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonData))

	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}

	req.Header.Set("Content-Type", "application/json")

	resp, err := client.Do(req)

	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}
	var apiResponse AIModel.ResponseAIApp
	err = json.Unmarshal(body, &apiResponse)
	if err != nil {
		return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: err.Error(), ErrCode: model.Authorized})
	}

	return ctx.JSON(http.StatusOK, &model.MessageHandler{Message: "Success Image Processing", ErrCode: model.NoError, Data: apiResponse.Received_message})
}
