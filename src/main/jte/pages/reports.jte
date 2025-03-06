@param java.util.List<String> reportData
@param java.util.List<com.alkalam.publisher.entity.Company> allCompany

<style>
    table {
           width: 100%;
           border-collapse: collapse;
       }
       table, th, td {
           border: 1px solid #ddd;
       }
       th, td {
           padding: 8px;
           text-align: left;
       }
       th {
           background-color: #f2f2f2;
       }
</style>

@template.layout.dashboard(content = @`
    <div class="bg-white shadow rounded-lg p-6">
        <h1 class="text-2xl font-bold mb-4">Company List</h1>
<%--        <ul class="list-disc list-inside">--%>
<%--            @for(String member : reportData)--%>
<%--                <li class="text-gray-600">${member}</li>--%>
<%--            @endfor--%>
<%--        </ul>--%>

<%--        <ul class="list-disc list-inside">--%>
<%--            @for(com.alkalam.publisher.entity.Company member : allCompany)--%>
<%--                <li class="text-gray-600">${member.getComDescEn()}</li>--%>
<%--                <li class="text-gray-600">${member.getComDescAr()}</li>--%>
<%--            @endfor--%>
<%--        </ul>--%>

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>English Name</th>
                <th>Arabic Name</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            @for(com.alkalam.publisher.entity.Company member : allCompany)
                <tr>
                    <td>${member.getId()}</td>
                    <td>${member.getComDescEn()}</td>
                    <td>${member.getComDescAr()}</td>
                    <td>${member.getEmail()}</td>
                </tr>
            @endfor
            </tbody>
        </table>


    </div>
`)

<%--<main>--%>
<%--    <h2>@reportTitle</h2>--%>
<%--    <p>This is the reports section. Here you can view and manage your reports.</p>--%>
<%--    <ul>--%>
<%--        @for (String data : reportData)--%>
<%--            <li>${data}</li>--%>
<%--        @endfor--%>
<%--    </ul>--%>
<%--</main>--%>