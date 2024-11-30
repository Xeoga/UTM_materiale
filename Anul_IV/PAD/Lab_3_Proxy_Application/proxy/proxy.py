from flask import Flask, request, jsonify
import redis
import requests
import random

app = Flask(__name__)

# Redis pentru caching
redis_client = redis.StrictRedis(host='Server_reddis', port=6379, db=0)

# Serverele
dw_servers = [
    "http://Server_App:5000" # Aici pot sa fie mai multe servere :)
]

#load-balancing (Round-Robin) Alege random din 1 HEHEHEHEHEHEH
def get_dw_server():
    return random.choice(dw_servers)

# Endpoint pentru gestionarea cererilor GET
@app.route('/employees', methods=['GET'])
def proxy_get():
    employee_id = request.args.get('id')
    cache_key = f"employee:{employee_id}"

    # Verifică dacă răspunsul este în cache
    cached_response = redis_client.get(cache_key)
    if cached_response:
        return jsonify({"source": "cache", "data": cached_response.decode('utf-8')})

    # Dacă nu e în cache, trimite cererea către serverul DW
    dw_server = get_dw_server()
    try:
        response = requests.get(f"{dw_server}/employees", params={"id": employee_id})
        if response.status_code == 200:
            redis_client.setex(cache_key, 300, response.text)  # Stochează în cache pentru 5 minute 1 oră: 3600 1 zi: 86400 1 săptămână: 604800 1 lună: 2592000
            return jsonify({"source": "dw", "data": response.json()})
        else:
            return response.text, response.status_code
    except requests.RequestException as e:
        return jsonify({"error": f"Failed to connect to DW server: {e}"}), 500

# Endpoint pentru gestionarea cererilor POST
@app.route('/employees', methods=['POST'])
def proxy_post():
    data = request.json
    dw_server = get_dw_server()
    try:
        response = requests.post(f"{dw_server}/employees", json=data)
        if response.status_code == 201:
            return jsonify({"message": "Employee added successfully"})
        else:
            return response.text, response.status_code
    except requests.RequestException as e:
        return jsonify({"error": f"Failed to connect to DW server: {e}"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)
