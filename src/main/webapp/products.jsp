<%@page import="entities.ProductData"%>
<%@page import="controllers.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping site for Computers : Outletpc</title>
    </head>
    <body>

        <%@include file="Plugins/navbar.jsp"%>

        <%
            Product product = context.getBean("product", Product.class);
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            List<String> brands = product.getProductsBrands(id, null, "products");
        %>

        <section>
            <%@include file="Plugins/Products/container.jsp"%>
        </section>
        <%@include file="Plugins/footer.jsp"%>

        <script>
            const filter = () =>
            {
                let minPrice = $("#minPrice").val();
                let maxPrice = $("#maxPrice").val();
                let brands = String(getFilters(".brand"));
                let sort = String(getFilters(".sort"));
                let stock = String(getFilters(".stock"));

                $.ajax({
                    url: "filter.jsp",
                    data: {cId:<%= id%>, minPrice: minPrice, maxPrice: maxPrice, brands: brands, sort: sort, stock: stock, filter: "products"},
                    success: function (data) {
                        $("#productContainer").html(data);
                    },
                    error: function () {
                        alert("error");
                    }
                });
            };
        </script>

    </body>
</html>
