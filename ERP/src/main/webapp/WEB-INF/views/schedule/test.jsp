<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>

<html>

<head>

  <meta charset="utf-8">

  <title>jQuery UI Selectable - Default functionality</title>

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>

  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


 

  <style>

  #selectable .ui-selecting { background: #FECA40; }

  #selectable .ui-selected { background: #F39814; color: white; }

  #selectable { list-style-type: none; margin: 0; padding: 0;}

  </style>

  <script>

  $(function() {
    $( "#selectable" ).selectable();

  });

  </script>

</head>

<body>

 

<ol id="selectable">


  <li class="ui-widget-content" style="cursor: pointer;">Item 1</li>
  <li class="ui-widget-content" style="cursor: pointer;">Item 1</li>
  <li class="ui-widget-content" style="cursor: pointer;">Item 1</li>
  <li class="ui-widget-content" style="cursor: pointer;">Item 1</li>
  <li class="ui-widget-content" style="cursor: pointer;">Item 1</li>

</ol>

 

 

</body>

</html>

