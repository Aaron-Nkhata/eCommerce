<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<%-- <scripttype="text/javascript"src="${pageContext.request.contextPath}/client/js/my.js"></script> --%>
<script type="text/javascript">
	/**
	* my_click and my_blur are used to search
	*/
	//click
	function my_click(obj, myid)
	{
		//clear the search box if the value is equal to default value
		if (document.getElementById(myid).value ==document.getElementById(myid).defaultValue)
		{
			document.getElementById(myid).value = '';
			obj.style.color='#000';
		}
	}
	//when mouse is not foucus on the box
	function my_blur(obj, myid)
	{
	//fill the defalut value when the box lost focus
		if (document.getElementById(myid).value=='')
		{
			document.getElementById(myid).value = document.getElementById(myid).defaultValue;
			obj.style.color='#999';
		}
	}
	/**
	* search the data when click it
	*/
	function search()
	{
	document.getElementById("searchform").submit();
	}
</script>

<div id="divmenu">
<a href="${pageContext.request.contextPath}/showProductByPage?category=Shoes">SHOES</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Clothes">CLOTHES</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Ebikes">E-BIKES</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Jewelry">JEWELRY</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Books">BOOKS</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Furniture">FURNITURE</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Gym">GYM</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=MusicInstruments">MUSIC-INSTRUMENTS</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Art">ARTS</a>
<a href="${pageContext.request.contextPath}/showProductByPage?category=Others">OTHERS</a>

</div>

<div id="divsearch">
	<form
	    action="${pageContext.request.contextPath }/MenuSearchSerlvet"
	    id="searchform">
	
	    <table
	        width="100%"
	        border="0"
	        cellspacing="0">
	
	        <tr>
	
	            <td style="text-align:center; font-size:20px; font-family:Comic Sans MS">
	                web search
	
	                <input
	                    type="text"
	                    name="textfield"
	                    class="inputtable"
	                    id="searchtextfield"
	                    placeholder="search for anything"
	                    size="40"
	                    maxlength="20"
	                    onmouseover="this.focus();"
	                    onclick="my_click(this, 'textfield');"
	                    onBlur="my_blur(this, 'textfield');" 
	                    />
	
	                <a href="#"  >
	
	                    <img
	                        src="${pageContext.request.contextPath}/client/images/Searchicon.JPG"
	                        width="30" height="20"
	                        border="0"	
	                  
	                        onclick="search()" />
	                </a>
	            </td>
	        </tr>
	    </table>
	</form>
</div>