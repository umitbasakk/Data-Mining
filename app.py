from flask import Flask,request,jsonify


app = Flask(__name__)


class Food:
    def __init__(self, foodUrl, foodName,foodCalories,foodPrice):
        self.foodUrl = foodUrl
        self.foodName = foodName
        self.foodCalories = foodCalories
        self.foodPrice = foodPrice
    
    def to_dict(self):
        return {
            "foodUrl": self.foodUrl,
            "foodName": self.foodName,
            "foodCalories": self.foodCalories,
            "foodPrice": self.foodPrice
        }

#("FOOD URL", "FOOD NAME","FOOD CALORIES","FOOD PRICE")
@app.route('/receiverImage', methods=['POST'])
def receive_image():
    data = request.get_json()
    food = []
    #food_list needs to be filled
    food_list = [
        ("https://cdn.yemek.com/mncrop/940/625/uploads/2015/11/kuru-fasulye-yemekcom.jpg", "Kuru Fasulye","357","100")]

    for url,name,calories,price in food_list:
        foodObject = Food(url,name,calories,price)
        food.append(foodObject.to_dict())
    
    if not data or 'url' not in data:
        return jsonify({"error": "No 'message' field found in request"}), 400


    return jsonify({"status": "success", "received_message": food}),200

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)
