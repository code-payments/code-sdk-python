from flask import Flask, jsonify, render_template
from code_wallet.client.intents import payment_intents

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

# Route to create a payment intent
@app.route('/create-intent', methods=['POST'])
def create_intent():
    test_data = {
        'amount': 0.05,  # Minimum amount is $0.05 USD
        'currency': 'usd',
        'destination': 'E8otxw1CVX9bfyddKu3ZB3BVLa4VVF9J7CTPdnUwT9jR',
    }

    try:
        response = payment_intents.create(test_data)
    except Exception as e:
        return jsonify(error=str(e)), 400

    return jsonify(clientSecret=response['clientSecret'])

# Route to verify a payment intent
@app.route('/verify/<id>', methods=['GET'])
def verify_intent(id):

    try:
        response = payment_intents.get_status(id)
        status = response.get('status')
    except Exception as e:
        return jsonify(error=str(e)), 400

    return jsonify(status=status)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)