<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>

    <title>online bookstore</title>

    <link
        rel="stylesheet"
        href="../css/main.css"
        type="text/css" />

    <script
        type="text/javascript"
        src="../js/my.js"></script>
</head>

<body class="main">

    <div id="divcontent">

        <table
            width="850px"
            border="0"
            cellspacing="0">

            <tr>

                <td style="padding:30px; text-align:center">

                    <table
                        width="60%"
                        border="0"
                        cellspacing="0"
                        style="margin-top:70px">

                        <tr>

                            <td style="width:98">

                                <img
                                    src="../images/error.jpg"
                                    width="128"
                                    height="128" />
                            </td>

                            <td style="padding-top:30px">

                                <font style="font-weight:bold; color:#ff0000">Insufficient
                                    privileges, please log in and operate</font>

                                <br />

                                <br />

                                <a href="${pageContext.request.contextPath }/index.jsp">
                                    Automatically jump back to home page in
                                    seconds

                                    <span id="second">5</span>
                                </a>
                            </td>
                        </tr>
                    </table>

                    <h1>&nbsp;</h1>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>