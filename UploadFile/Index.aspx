<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script>
        $(document).ready(function () {
            
            $('#file_upload_form').submit(function () {
                $('#file_upload_form').attr('action', 'readFile.aspx');
                $('#msg').html('uploading....');
            });

            $('#upload_frame').load(function () {
                var frame = document.getElementById('upload_frame');
                var frameDiv= frame.contentDocument.getElementsByTagName('div')[0];

                var responseText = JSON.parse(frameDiv.innerHTML);
                if (responseText.line1 != '1') alert("Esta Mal");
                document.getElementById("showText").innerHTML = "<p>" + responseText.line1 + "</p>" + "<p>" + responseText.lines + "</p>";
               
                $('#msg').html('El Archivo se ha Cargado Correctamente.');
                $('#upload_frame').removeAttr('src');
              
               
            });
        })
    </script>
</head>
<body>
    <form id="file_upload_form" method="post" enctype="multipart/form-data" target="upload_frame">
         <label for="upload_field">Seleccione Un Archivo: </label>
         <input type="file" id="upload_field" name="upload_field" />
         <input type="submit" value="Upload" />             
    </form>
    <iframe id="upload_frame" name="upload_frame"></iframe>
    <div id="msg"></div>
    <div id="showText"></div>
</body>
</html>
