<%-- 
    Document   : amortizacao-americana
    Created on : 08/03/2020, 21:31:57
    Author     : k3k1z3r0
--%>


<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
             table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
    </head>
    <body>
        <h1>Tabela Price</h1>
    
        <form action="">
            <input type="number" name="periodo">
            <input type="number" name="saldo" >
            <input type="number" name="juros">
            <input type="submit" value="Submit">
</form>
        <% 
            if(request.getParameter("periodo") !=null &&
                request.getParameter("saldo") !=null &&    
                    request.getParameter("juros") !=null ){
    double p = Double.parseDouble(request.getParameter("periodo"));
    double s  = Double.parseDouble(request.getParameter("saldo"));
    double j = Double.parseDouble(request.getParameter("juros"));
   
    
   
  j = (j/100)*s;  
    
  
    DecimalFormat decimalFormat = new DecimalFormat("0.00");
    
    

    for(int i = 0;i<=p;i++){
        
        
    
    %>
   
       
    <% if(i==0){ %>
          <table>
  <tr>
    <th>Mes</th>
    <th>Saldo do Devedor</th>
    <th>Amortização</th>
    <th>Juros</th>
    <th>Prestação</th>
  </tr>
 
 
 
   <tr>
      <td><%=i%></td>
      <td><%=decimalFormat.format(s)%></td>
      <td></td>
    <td></td>
    <td></td>
   </tr>
       
   <%}if(i==p)
   {%>
   <tr>
   <td><%=i%></td>
      <td></td>
    <td><%=decimalFormat.format(s)%></td>
    <td><%=decimalFormat.format(j)%></td>
    <td><%=decimalFormat.format(j+s)%></td>
  </tr> 
   
      <%} else {%>
      <tr>
      <td><%=i%></td>
      <td><%=decimalFormat.format(s)%></td>
    <td></td>
    <td><%=decimalFormat.format(j)%></td>
    <td><%=decimalFormat.format(j)%></td>
  </tr>          
     <% 
    }
    }
            
   %>
   <tr>
      <td>Total = </td>
      <td></td>
    <td><%=decimalFormat.format(s)%></td>
    <td><%=decimalFormat.format(j*p)%></td>
    <td><%=decimalFormat.format(s+(j*p))%></td>
  </tr>    
  </table>
    <% } %>
     
     
    </body>
</html>
