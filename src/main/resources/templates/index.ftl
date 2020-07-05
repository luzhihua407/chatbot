<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>web ui</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="card" style="width: 18rem;">
        <div class="card-body overflow-hidden" id="content">
        </div>
        <div class="card-body">
                <div class="form-group">
                    <input type="text" class="form-control" id="question" name="question" placeholder="请输入您的问题">
                </div>
                <button type="submit" class="btn btn-primary" id="send">发送</button>
        </div>
    </div>

</div>
<#--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $("#send").click(function () {
            var question=$("#question").val();
            $.ajax({
                type: "GET",
                url: "http://localhost:8888/tall",
                data: "msg="+question,
                beforeSend:function(xhr){
                    $("#content").append(question);
                },
                success: function(msg){
                    $("#content").append("<p class=\"card-text\">").append(msg).append("</p>");
                }
            });
        });

    });
</script>
</body>
</html>