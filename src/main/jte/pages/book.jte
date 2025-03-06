@param java.util.List<com.alkalam.publisher.entity.Book> bookList
@param java.util.List<com.alkalam.publisher.entity.Company> companies
@param int currentPage
@param int totalPages
@param long totalItems
@param int size
@param Integer companyId
@param String searchTerm

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
    .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }
     .search-box {
            margin-bottom: 20px;
        }

     /* Style for the search button */
        .search-box button {
            background-color: #007bff; /* Blue background */
            color: white; /* White text */
            border: none; /* Remove default border */
            padding: 8px 16px; /* Add padding */
            cursor: pointer; /* Change cursor to pointer */
            border-radius: 4px; /* Rounded corners */
        }
        /* Hover effect for the search button */
        .search-box button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

    /* Alternating row colors */
        table tbody tr:nth-child(odd) {
            background-color: #f9f9f9; /* Light gray for odd rows */
        }
        table tbody tr:nth-child(even) {
            background-color: #ffffff; /* White for even rows */
        }

        /* Optional: Hover effect for rows */
        table tbody tr:hover {
            background-color: #f1f1f1; /* Light gray on hover */
        }

     /* Basic styles for spinner */
        #spinner {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: rgba(255, 255, 255, 0.8);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .hidden {
            display: none;
        }

        /* Loading animation */
        .loader {
            border: 6px solid #f3f3f3;
            border-top: 6px solid #3498db;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

<%--    .search-box input {--%>
<%--    width: 70%;--%>
<%--    padding: 8px;--%>
<%--}--%>
<%--.search-box button {--%>
<%--    width: 25%;--%>
<%--}--%>
<%--@media (max-width: 600px) {--%>
<%--    .search-box input {--%>
<%--        width: 60%;--%>
<%--    }--%>
<%--    .search-box button {--%>
<%--        width: 35%;--%>
<%--    }--%>
<%--}--%>
</style>
<body onload="hideSpinner()">
@template.layout.settings(content = @`
    <div class="bg-white shadow rounded-lg p-6">
        <h1 class="text-2xl font-bold mb-4">Book List</h1>

        <!-- Search Form -->
        <div class="search-box">
            <form action="/book" method="post">
                <input type="text" name="search" placeholder="Search by book name..." value="${searchTerm}" style="padding: 10px; font-size: 16px; width: 300px;">

<%--                <button type="submit">--%>
<%--                    <i class="fas fa-search"></i> Search--%>
<%--                </button>--%>

<%--                <input type="text" name="search" placeholder="Search by book name..." value="${searchTerm}">--%>
<%--                <button type="submit">Search</button>--%>

                <!-- Dropdown for Categories -->
                <label> Company
                    <select name="companyId" style="padding: 10px; font-size: 16px; width: 300px;">
                        <option value="0">All Companies</option>
                        @for (com.alkalam.publisher.entity.Company company : companies)
    <%--                        <option value="${company.getId()}"--%>
    <%--                                @if (companyId != null && companyId == company.getId()) selected @endif>${company.getComDescAr()}</option>--%>
    <%--                                >${company.getComDescAr()}--%>

                            <option value="${company.getId()}"
                                    selected='${company.getId()==(companyId==null?0:companyId.intValue())}'>${company.getComDescAr()}</option>

<%--                            <option value="${company.getId()}"--%>
<%--                            @if(company.getComDescAr().equals("1")) { selected }@endif--%>
<%--                                        >${company.getComDescAr()}</option>--%>



                        @endfor
                    </select>
                </label>

                <button type="submit" style="padding: 10px 20px; font-size: 16px;">
                    <i class="fas fa-search"></i> Search
                </button>


            </form>
        </div>

        <table>
            <thead>
            <tr>
<%--                <th>ID</th>--%>
<%--                <th>English Name</th>--%>
                <th>الرمز</th>
                <th>عنوان الكتاب</th>
                <th>موضوع الكتاب</th>
                <th>اسم الدار</th>
            </tr>
            </thead>
            <tbody>
            @for(com.alkalam.publisher.entity.Book member : bookList)
                <tr>
<%--                    <td>${member.getBookId()}</td>--%>
<%--                    <td>${member.getBookTitleEn()}</td>--%>
                    <td>${member.getBookCode()}</td>
                    <td>${member.getBookTitleAr()}</td>
                    <td>${member.getBookSubDesc()}</td>
                    <td>${member.getCompany().getComDescAr()}</td>
                </tr>
            @endfor
            </tbody>
        </table>
    </div>
        <!-- Pagination Controls -->
    <div class="pagination">
        @if (currentPage > 0)
            <a href="/book?page=0&size=${size}&search=${searchTerm}">First</a>
            <a href="/book?page=${currentPage - 1}&size=${size}&search=${searchTerm}">Previous</a>
        @endif

<%--        @for (int i = 0; i < totalPages; i++)--%>
<%--            <a href="/book?page=${i}&size=${size}" class="${i == currentPage ? 'active' : ''}">${i + 1}</a>--%>
<%--        @endfor--%>

        @if (currentPage < totalPages - 1)
            <a href="/book?page=${currentPage + 1}&size=${size}&search=${searchTerm}">Next</a>
            <a href="/book?page=${totalPages - 1}&size=${size}&search=${searchTerm}">Last</a>
        @endif
    </div>

        <p>Total Books: ${totalItems}</p>



`)
</body>

<script>
    function hideSpinner() {
        document.getElementById("spinner").classList.add("hidden");
        document.getElementById("content").classList.remove("hidden");
    }
</script>