	<!-- header.jsp -->
	<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css">
	</head>
	<!-- Header before User login and Admin login -->
	<%
	if (session.getAttribute("loggedUser") == null && session.getAttribute("loggedAdmin") == null) {
	%>
	
	<header>
		<div class="logo_text">
			<img src="<%=request.getContextPath()%>/images/bb_logo.png" alt="e_commison-logo" width="10%"
				height="10%" style="border-radius: 1.5rem;" /> <a
				href="<%=request.getContextPath() + "/index" %>">
				<p>BallotBox</p>
			</a>
		</div>

		<div>
			<a href="<%=request.getContextPath() + "/userlogin"%>"><button>User</button></a>
			<a href="<%=request.getContextPath() + "/adminlogin"%>"><button>Admin</button></a>
		</div>
	</header>
	<%
	} else if (session.getAttribute("loggedUser") != null){
	%>
	<!-- Header after User login -->
	<header>
		<div class="logo_text">
			<img src="<%=request.getContextPath()%>/images/bb_logo.png" alt="e_commison-logo" width="10%"
				height="10%" style="border-radius: 1.5rem;" /> <a
				href="<%=request.getContextPath() + "/index" %>">
				<p>BallotBox</p>
			</a>
		</div>

		<div>
			<a href="<%=request.getContextPath() + "/select"%>"><button>Elections</button></a> 
			<a href="<%=request.getContextPath() + "/profile"%>"><button>Profile</button></a> 
			<a href="<%=request.getContextPath() + "/userlogout"%>"><button>Logout</button></a>
		</div>
	</header>
	<%
	} else if (session.getAttribute("loggedAdmin") != null)  {
	%>
	<!-- Header after Admin login -->
	<header>
		<div class="logo_text">
			<img src="<%=request.getContextPath()%>/images/bb_logo.png" alt="e_commison-logo" width="10%"
				height="10%" style="border-radius: 1.5rem;" /> <a
				href="<%=request.getContextPath() + "/index" %>">
				<p>BallotBox</p>
			</a>
		</div>

		<div>
		    <a href="<%=request.getContextPath() + "/users"%>"><button>Voter Approve</button></a> 
			<a href="<%=request.getContextPath() + "/elections"%>"><button>Add Elections</button></a> 
			<a href="<%=request.getContextPath() + "/candidates"%>"><button>Add Candidates</button></a> 
			<a href="<%=request.getContextPath() + "/adminlogout"%>"><button>Logout</button></a>
		</div>
	</header>
	<%
	}
	%>