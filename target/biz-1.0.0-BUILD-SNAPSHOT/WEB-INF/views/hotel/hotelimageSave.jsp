<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    })
 
    function addFile() {
        var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>����</a></div>";
        $("#file-list").append(str);
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    }
 
    function deleteFile(obj) {
        obj.parent().remove();
    }
    
   	function savemessage(){
   		alert('�̹��� ���� �Ϸ�');
   	}
   	
	function closefunction(){
   		self.close(); 
   	}
</script>

<form action="hotelimageSave1.do" 
	method="post" enctype="multipart/form-data">
	
    <!-- ���� -->
    <div class="form-group" id="file-list">
        <a href="#this" onclick="addFile()">�����߰�</a>
        <div class="file-group">
            <input type="file" name="file"><a href='#this' name='file-delete'>����</a>
        </div>
    </div>
    <button type="submit" class="btn btn-default" onclick="savemessage()">�����ϱ�</button>
    <button type="button" class="btn btn-default" onclick="closefunction()">�ݱ�</button>
</form>




</body>
</html>