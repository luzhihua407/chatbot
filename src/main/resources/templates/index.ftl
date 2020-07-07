<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>web ui</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/botui/build/botui.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/botui/build/botui-theme-default.css" />

</head>
<body>

<div class="container">
    <div class="botui-app-container" id="hello-world">
        <bot-ui></bot-ui>
    </div>

</div>
<#--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/vue/latest/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/botui/build/botui.js"></script>
<script>
    var loadingMsgIndex,
        botui = new BotUI('hello-world'),
        API = "${server}/tall?msg=";

    function sendXHR(repo, cb) {
        var xhr = new XMLHttpRequest();
        var self = this;
        xhr.open('GET', API + repo);
        xhr.onload = function () {
            console.log(xhr);
            var res = xhr.responseText
            cb(res);
        }
        xhr.send();
    }
    botui.message
        .bot({
            delay: 1000,
            content: '嗨！我是您的客服小秘'
        })
    function init() {
                botui.action.text({
                    delay: 1000,
                    action: {
                        placeholder: '请输入信息'
                    }
                }).then(function (res) {
                    loadingMsgIndex = botui.message.bot({
                        delay: 200,
                        loading: true
                    }).then(function (index) {
                        loadingMsgIndex = index;
                        sendXHR(res.value, showStars)
                    });
                });
    }

    function showStars(stars) {
        botui.message
            .update(loadingMsgIndex, {
                content: stars
            })
            .then(init); // ask again for repo. Keep in loop.
    }

    init();
</script>
<script>
    $(document).ready(function(){
        $("#send").click(function () {
            var question=$("#question").val();
            $.ajax({
                type: "GET",
                url: "${server}/tall",
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