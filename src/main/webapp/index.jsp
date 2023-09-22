<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BallotBox</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<!--Header JSP-->
<jsp:include page="header.jsp" />
</head>

<body>

	<!-- <div class="body_bg">
        <img src="./assets/images/background.jpg" alt="background" class="background" />
    </div> -->

	<%
	 if (session.getAttribute("loggedUser") != null || session.getAttribute("loggedAdmin") == null){
	%>

	<div class="main">

		<img src="./images/landing_page_img.png" alt="index_bg" />
		<div class="side_text" style="margin-top: 10rem;">
			<h1>Online Voting</h1>
			<p class="side_text" style="color: gray; font-weight: bold;">BallotBox.com</p>
			<p class="side_text">"Welcome to the future of democracy! Our
				online voting project is here to revolutionize the way you
				participate in elections, making it easier and more accessible than
				ever before. Join us in shaping the future of civic engagement as we
				bring the power of the ballot to your fingertips."</p>

			<%
	         if (session.getAttribute("loggedUser") == null) {
	         %>
			<a href="<%=request.getContextPath() + "/userlogin"%>"><button
					class="index_vtbtn">Vote now</button></a>
			<%
	         } else {
	         %>
			<a href="<%=request.getContextPath() + "/select"%>"><button
					class="index_vtbtn">Vote now</button></a>
			<%
	         }
	         %>
		</div>
	</div>

	<h2>List of Political Parties in Tamil Nadu</h2>
	<iframe
		src="https://en.wikipedia.org/wiki/List_of_political_parties_in_Tamil_Nadu"
		title="description"></iframe>
	<h2>Top Political Parties in India and Tamil Nadu</h2>
	<div class="partners">
		<ul class="image-gallery">
			<img src="./images/party_images/bjp.png" alt="bjp_background"
				class="background" />
			<img src="./images/party_images/congress.png"
				alt="congress_background" class="background" />
			<img src="./images/party_images/aap.jpg" alt="aap_background"
				class="background" />
			<img src="./images/party_images/ait.png" alt="ait_background"
				class="background" />
			<img src="./images/party_images/cpim.png" alt="cpim_background"
				class="background" />
			<img src="./images/party_images/bsp.png" alt="bsp_background"
				class="background" />
			<img src="./images/party_images/sp.png" alt="sp_background"
				class="background" />
			<img src="./images/party_images/jds.png" alt="jds_background"
				class="background" />
			<img src="./images/party_images/dmk.png" alt="dmk_background"
				class="background" />
			<img src="./images/party_images/aiadmk.png" alt="aiadmk_background"
				class="background" />
			<img src="./images/party_images/pmk.jpg" alt="pmk_background"
				class="background" />
			<img src="./images/party_images/ntk.png" alt="ntk_background"
				class="background" />
			<img src="./images/party_images/dmdk.jpg" alt="dmdk_background"
				class="background" />
			<img src="./images/party_images/mnm.png" alt="mnm_background"
				class="background" />
			<img src="./images/party_images/ammk.jpg" alt="ammk_background"
				class="background" />
			<!-- Add more images as needed -->
		</ul>
	</div>
	<%
	}
    %>
    
    <%
	 if (session.getAttribute("loggedAdmin") != null){
	%>
		<img src="./images/admin2.jpg" alt="index_bg" width="100%" />
	<%
	 }
	%>
	<div class="icons">
		<img src="./images/vote2.png" alt="background" class="background"
			width="100%" height="100%" />
		<p class="footer_text">© Copyright BallotBox.com All rights
			reserved 2023</p>
	</div>
	<!-- <script src="https://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script> -->
</body>

</html>