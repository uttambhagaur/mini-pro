<!DOCTYPE html>
<html>
<head>
<title>Design Maker|Resume 1</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }
    </script>
     <style type="text/css">
        .business-card {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  height: 250px;
  width: 500px;
  background: #f12e50;
  border-radius: 30px;
}
.business-card:before, .business-card:after {
  content: '';
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  right: 0;
}
.business-card:before {
  background: #ee0c4b;
  border-top-right-radius: 30px;
  -webkit-clip-path: polygon(20% 0, 100% 0, 100% 30%, 40% 70%);
          clip-path: polygon(20% 0, 100% 0, 100% 30%, 40% 70%);
}
.business-card:after {
  background: #c80e3d;
  border-bottom-right-radius: 30px;
  -webkit-clip-path: polygon(40% 70%, 100% 30%, 100% 100%, 48.5% 100%);
          clip-path: polygon(40% 70%, 100% 30%, 100% 100%, 48.5% 100%);
}

div {
  z-index: 2;
}

.bc__logo {
  position: absolute;
  top: 10%;
  right: 10%;
}
.bc__logo figure {
  position: relative;
  display: inline-block;
  height: 4em;
  width: calc(4em * 0.57735);
  border-radius: .5em/.25em;
  background: white;
  -webkit-transform: rotate(90deg);
          transform: rotate(90deg);
}
.bc__logo figure:before, .bc__logo figure:after {
  position: absolute;
  width: inherit;
  height: inherit;
  border-radius: inherit;
  background: inherit;
  content: '';
}
.bc__logo figure:before {
  -webkit-transform: rotate(60deg);
          transform: rotate(60deg);
}
.bc__logo figure:after {
  -webkit-transform: rotate(-60deg);
          transform: rotate(-60deg);
}
.bc__logo i {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  height: 25%;
  width: 70%;
  background: #ee0c4b;
  -webkit-transform: skew(-30deg) rotate(-90deg);
          transform: skew(-30deg) rotate(-90deg);
  z-index: 2;
}
.bc__logo i:before, .bc__logo i:after {
  content: '';
  position: absolute;
  width: 60%;
  height: 75%;
  background: inherit;
  z-index: 5;
}
.bc__logo i:before {
  top: -82%;
  right: 24%;
  -webkit-transform: skew(-40deg) rotate(90deg);
          transform: skew(-40deg) rotate(90deg);
}
.bc__logo i:after {
  bottom: -85%;
  right: 23%;
  -webkit-transform: skew(-40deg) rotate(90deg);
          transform: skew(-40deg) rotate(90deg);
}
.bc__logo h2 {
  display: inline-block;
  padding-left: .65em;
  color: white;
  font-size: 2em;
  font-weight: 900;
  letter-spacing: -1px;
  line-height: 2;
  vertical-align: top;
}

.bc__tagline {
  position: absolute;
  bottom: 10%;
  right: 5%;
  color: white;
  line-height: 1.4;
  text-align: right;
}
.bc__tagline em {
  font-weight: 600;
  font-style: italic;
}

body {
  background: #111;
  font: 400 .875em 'Helvetica Neue', 'Roboto Sans', Helvetica, Arial, Sans-serif;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

.credit {
  position: absolute;
  bottom: 15%;
  width: 100%;
  color: white;
  text-align: center;
}
.credit a {
  color: #ea4c89;
  text-decoration: none;
}

     </style>
</head>

<body>
<div class="navbar">
<ul>
<li><a href="index.html">Home</a></li>
<li><a href="resume.jsp">Resume</a></li>
<li><a href="business.jsp">Business Card</a></li>
<li><a href="#">University Card</a></li>
<li style="float:right; font-size:20px;"><a href="login.jsp"><i class="fa fa-user"></i> Login / SignUp</a></li>

</ul>
</div>
<div class="container">
    <input type="submit" value="print" class="print" onclick="printDiv('printablediv')" />
<div class='business-card' id="printablediv">
  <div class='bc__logo'>
    <figure><i></i></figure>
    <h2>Design Maker</h2>
  </div>
  <div class='bc__tagline'>
    <p>Putting a <em>slant</em> on your<br>Web Design &amp; Branding Projects</p>
  </div>
</div>    
</div>
     <div class="footer">
  &copy; Design Maker
</div>
</body>

</html>
