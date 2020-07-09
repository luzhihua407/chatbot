<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>web ui</title>
<#--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/botui/build/botui.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/botui/build/botui-theme-default.css" />
    <style>
        .botui-container {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            font-size: 12px;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
            background-color: #fff;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="botui-app-container" id="hello-world">
        <bot-ui></bot-ui>
    </div>

</div>
<#--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
<#--<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>-->
<#--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>-->
<#--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/vue/latest/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/botui/build/botui.js"></script>
<script>
    let loadingMsgIndex,
        botui = new BotUI('hello-world',// options with default values.
            {
                debug: true, // set this to true if you want to debug the underlaying Vue instance
                fontawesome: false, // set this to false if you already have FontAwesome in your project and don't want it to be loaded again by BotUI.
            }),
        API = "${server}/tall?msg=";

    function sendXHR(repo, cb) {
        let xhr = new XMLHttpRequest();
        let self = this;
        xhr.open('GET', API + repo);
        xhr.onload = function () {
            console.log(xhr);
            let res = xhr.responseText
            cb(res);
        }
        xhr.send();
    }

    botui.message
        .bot({
            delay: 1000,
            content: '嗨！我是您的客服兔女郎'
        }).then(function (index) {
        return botui.action.button({
                delay: 200,
                loading: true,
                addMessage: false,
                action: [{
                    text:'不需要帮助',
                    value:'不需要帮助'
                },{
                    text:'需要帮助',
                    value:'帮助'
                }
                ]
            }).then(function (res) {
                console.log(res.value)
                if(res.value=='帮助'){
                    sendXHR(res.value, renderResult)
                }else{
                    init();
                }


            });
    });

    function init() {
                botui.action.text({
                    autoHide: false,
                    action: {
                        placeholder: '请输入信息'
                    }
                    }).then(function (res) {
                        if(res.value!=''){

                        sendXHR(res.value, renderResult)
                        }
                    });
    }

    function renderResult(respResult) {
        botui.message
            .add({
                type: 'html', // this is 'text' by default
                loading: true,
                delay: 200,
                content: respResult
            })
            .then(init); // ask again for repo. Keep in loop.
    }

    init();
</script>
</body>
</html>