<%-- 
    Document   : tabela_price
    Created on : 07/03/2020, 16:47:01
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
   
    
   
    
    double pmt= s*((j/100)/(1-(1/(Math.pow((j/100)+1, p)))));
  
    DecimalFormat decimalFormat = new DecimalFormat("0.00");
    
    double a = pmt-(j*s)/100;
    j=j*s/100;

    for(int i = 0;i<=p;i++){
        
        
    
    %>
   
       
    <% if(i==0){ %>
          <table>
  <tr>
    <th>Período</th>
    <th>Saldo do Devedor</th>
    <th>Parcela</th>
    <th>Juros</th>
    <th>Amortização</th>
  </tr>
 
 
 
   <tr>
      <td><%=i%></td>
      <td><%=decimalFormat.format(s)%></td>
      <td></td>
    <td></td>
    <td></td>
   </tr>
       
      <% }else {%>
      <td><%=i%></td>
      <td><%=decimalFormat.format(s-a)%></td>
    <td><%=decimalFormat.format(pmt)%></td>
    <td><%=decimalFormat.format(j)%></td>
    <td><%=decimalFormat.format(a)%></td>
  </tr>          
     <% 
     
        
    j=j/s;
   
     
     
     s=s-a;
     
    
    
    j=(s*j);

    a=pmt-j;
    }
    }
            }
   %>  
  </table>
     
     
    </body>
</html>
