from flask import Flask, render_template_string, request, jsonify
import os, json

app = Flask(__name__)

# The TEMPLATE string defines the HTML structure for the dashboard
TEMPLATE = """
<!DOCTYPE html>
<html>
<head><title>Polyglot Game Dashboard</title></head>
<body>
    <h1>Current High Scores</h1>
    <ul>
        {% for score in scores %}
            <li>{{ score }}</li>
        {% endfor %}
    </ul>
</body>
</html>
"""

@app.route('/')
def index():
    scores_path = 'scores.txt'
    scores_data = []
    if os.path.exists(scores_path):
        with open(scores_path, 'r') as f:
            # Reads COBOL-generated score entries
            scores_data = [line.strip() for line in f.readlines() if line.strip()]
    return render_template_string(TEMPLATE, scores=scores_data)

@app.route('/upload-level', methods=['POST'])
def upload_level():
    # Handles real-time level injection into the levels.json engine
    idx = int(request.form.get('level_idx', 0))
    matrix_raw = request.form.get('matrix', '').strip().split('\r\n')
    if len(matrix_raw) == 1:
        matrix_raw = request.form.get('matrix', '').strip().split('\n')
    
    # Update logic for config/levels.json would follow here
    return jsonify({"status": "success", "level_updated": idx})

if __name__ == '__main__':
    print("\n--- High Score Dashboard live at http://127.0.0.1:5000 ---")
    app.run(host='0.0.0.0', port=5000, debug=False)
