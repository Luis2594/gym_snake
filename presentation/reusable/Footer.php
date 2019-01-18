<br>
<br>
<div class="w3-black w3-center w3-padding-24">© Luis Castillo, 2017, Gym Snake</div>

<!-- End page content -->
</div>

<script>
    // Accordion 
    myAccFunc();
    function myAccFunc() {
        var x = document.getElementById("demoAcc");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }

    // Click on the "Jeans" link on page load to open the accordion for demo purposes
    document.getElementById("myBtn").click();

    // Script to open and close sidenav
    function w3_open() {
        document.getElementById("mySidenav").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidenav").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
    
    $(document).ready(function () {
        $('html, body').animate({
            scrollTop: $('#pageScroll').offset().top
        }, 'slow');
    });

    $(document).ready(function () {
        $("#top").hide();
        $(function toTop() {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('#top').fadeIn();
                } else {
                    $('#top').fadeOut();
                }
            });

            $('#top').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 800);
                return false;
            });
        });
    });
    
</script>

</body>
</html>

