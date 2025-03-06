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

@template.layout.settings(content = @`
    <div class="bg-white shadow rounded-lg p-6">
        <h1 class="text-2xl font-bold mb-4">Company List</h1>

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
