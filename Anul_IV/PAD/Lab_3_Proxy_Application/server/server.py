from flask import Flask, request, jsonify
import cassandra.cluster

app = Flask(__name__)

# Conectare la baza de date Cassandra
cluster = cassandra.cluster.Cluster(['Server_cassandra'])
session = cluster.connect('employees')

@app.route('/employees', methods=['GET'])
def get_employee():
    employee_id = int(request.args.get('id'))
    query = "SELECT * FROM employee_data WHERE id = %s"
    result = session.execute(query, [employee_id])
    employee = result.one()
    if employee:
        return jsonify({"id": employee.id, "name": employee.name, "role": employee.role})
    else:
        return jsonify({"error": "Employee not found"}), 404

@app.route('/employees', methods=['POST'])
def add_employee():
    data = request.json
    try:
        data['id'] = int(data['id'])  # Convert ID to int
    except ValueError:
        return jsonify({"error": "Invalid ID format. ID must be an integer."}), 400
    query = "INSERT INTO employee_data (id, name, role) VALUES (%s, %s, %s)"
    session.execute(query, (data['id'], data['name'], data['role']))
    return jsonify({"message": "Employee added successfully"}), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)