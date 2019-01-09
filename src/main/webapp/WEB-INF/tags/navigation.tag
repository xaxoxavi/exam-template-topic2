<%--
  Created by IntelliJ IDEA.
  User: xavi
  Date: 18/12/18
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ tag body-content="empty" %>
<%@ attribute name="rover" type="java.lang.String" required="true" %>
<%@ attribute name="camera" type="java.lang.String" required="true"%>
<%@ attribute name="sol" type="java.lang.Integer" required="true"%>

<script>

    function fillPage(page){
        document.getElementById('page').value = page;
        document.getElementById('navForm').submit();

    }

</script>

<nav aria-label="Page navigation example" >
    <form method="post" action="/searchForm" id="navForm">
        <input type="hidden" name="page" id="page"/>
        <input type="hidden" name="rover" id="rover" value="${rover}"/>
        <input type="hidden" name="camera" id="camera" value="${camera}"/>
        <input type="hidden" name="sol" id="sol" value="${sol}"/>

    </form>
    <ul class="pagination justify-content-center bg-dark mt-3 text-dark">
        <li class="page-item"><a class="page-link" >Previous</a></li>
        <li class="page-item"><a class="page-link" >1</a></li>
        <li class="page-item"><a class="page-link"  onclick="fillPage(2)">2</a></li>
        <li class="page-item"><a class="page-link" >3</a></li>
        <li class="page-item"><a class="page-link" >Next</a></li>

    </ul>
</nav>

