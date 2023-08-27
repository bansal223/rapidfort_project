from flask import Flask, request, render_template
import os
import magic

app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.mkdir(UPLOAD_FOLDER)

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        file = request.files['file']
        if file:
            file_path = os.path.join(UPLOAD_FOLDER, file.filename)
            file.save(file_path)
            file_info = magic.from_file(file_path)
            mime_type = magic.from_file(file_path, mime=True)
            return render_template('upload.html', file_name=file.filename, file_info=file_info, mime_type=mime_type)
        else:
            return {"error": "File not provided"}, 400
    return render_template('upload.html')

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
