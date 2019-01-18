<?php
include './reusable/Header.php';
?>

<div id="pageScroll">
    <div id="la">

        The MIT License (MIT)

        Copyright (c) 2017 GYM SNAKE

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
        OF MERCHANTABILITY,FITNESS FOR A PARTICULAR PURPOSE AND 
        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
        HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
        WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
        DEALINGS IN THE SOFTWARE.

        AUTOR LUIS CASTILLO CALDERON
    </div>
</div>

<?php
include './reusable/Footer.php';
?>

<script type="text/javascript">
    $("#la").hide();
    var pre = document.createElement('pre');
//custom style.
    pre.style.maxHeight = "400px";
    pre.style.overflowWrap = "break-word";
    pre.style.margin = "-16px -16px -16px 0";
    pre.style.paddingBottom = "24px";
    pre.appendChild(document.createTextNode($('#la').text()));
//show as confirm
    alertify.confirm("",pre, function () {
        alertify.success('Listo');
    }, function () {
        alertify.error('Cerrado');
    }).setting('labels', {'ok': 'Entiendo', 'cancel': 'Cerrar'});
</script>