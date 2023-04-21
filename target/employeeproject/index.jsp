<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>File Upload Example</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
    <h1>Emloyee Information</h1>
    <form id="file-upload-form" action="/upload" method="post" enctype="multipart/form-data"> <label
            for="name-field">Name:</label> <input type="text" id="name-field" name="name" required><br><br> <label
            for="empid-field">Employee ID:</label> <input type="text" id="empid-field" name="empid" required><br><br>
        <h4>Documents</h4>
        <div id="documents" name="documentName">
            <div class="document"> <select class="document-type" id="doctype-field" name="docname[]" required>
                    <option value="pan">PAN Card</option>
                    <option value="aadhar">Aadhar Card</option>
                    <option value="voterid">Voter ID Card</option>
                </select> <input type="file" class="document-file" name="document[]" required> <button type="button"
                    class="remove-document" onclick="removeDocument(this)">Remove</button><br><br> </div>
        </div> <button type="button" onclick="addDocument()">Add Document</button><br><br> <input type="submit"
            value="Submit">
    </form>
    <script> const uri = "http://localhost:9090/upload"; function addDocument() {
            let documents = document.getElementById("documents");
            let documentTemplate = document.createElement("div");
            documentTemplate.classList.add("document");
            let typeSelector = document.createElement("select");
            typeSelector.classList.add("document-type");
            let panOption = document.createElement("option");
            panOption.value = "pan"; panOption.text = "PAN Card";
            typeSelector.appendChild(panOption);
            let aadharOption = document.createElement("option");
            aadharOption.value = "aadhar";
            aadharOption.text = "Aadhar Card";
            typeSelector.appendChild(aadharOption);
            let voterOption = document.createElement("option");
            voterOption.value = "voterid";
            voterOption.text = "Voter ID Card";
            typeSelector.appendChild(voterOption); documentTemplate.appendChild(typeSelector);
            let fileInput = document.createElement("input");
            fileInput.type = "file";
            fileInput.classList.add("document-file");
            fileInput.name = "document[]";
            fileInput.required = true;
            documentTemplate.appendChild(fileInput);
            let removeButton = document.createElement("button");
            removeButton.type = "button";
            removeButton.classList.add("remove-document");
            removeButton.textContent = "Remove";
            removeButton.addEventListener("click", function () { removeDocument(this) });
            documentTemplate.appendChild(removeButton);
            documents.appendChild(documentTemplate);
        }
        function removeDocument(button) {
            let documentElement = button.parentElement;
            let fileInput = documentElement.querySelector(".document-file");
            fileInput.value = null; documentElement.remove();
        } 
    </script>
</body>

</html>