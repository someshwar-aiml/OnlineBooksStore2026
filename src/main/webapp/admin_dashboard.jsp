<%@ include file="header.jsp" %>
<div class="container mt-4">
    <h2 class="text-danger fw-bold">Admin: Add New Book Content</h2>
    <div class="card bg-dark text-white border-secondary p-4 mt-3">
        <form action="saveBookAction.jsp" method="POST">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Book Title</label>
                    <input type="text" name="title" class="form-control bg-secondary text-white border-0" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Category (UPSC, JEE, NEET, etc.)</label>
                    <input type="text" name="category" class="form-control bg-secondary text-white border-0" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Cover Image URL (e.g., images/je1.webp)</label>
                    <input type="text" name="img" class="form-control bg-secondary text-white border-0">
                </div>
                <div class="col-md-6 mb-3">
                    <label>PDF Link (e.g., pdfs/book.pdf)</label>
                    <input type="text" name="pdf" class="form-control bg-secondary text-white border-0">
                </div>
            </div>
            <div class="mb-3">
                <label>About Book</label>
                <textarea name="about" class="form-control bg-secondary text-white border-0" rows="2"></textarea>
            </div>
            <div class="mb-3">
                <label>Book Summary</label>
                <textarea name="summary" class="form-control bg-secondary text-white border-0" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label class="text-warning fw-bold">📖 Full Book Text Content (Paste here)</label>
                <textarea name="textContent" class="form-control bg-secondary text-white border-0" rows="10"></textarea>
            </div>
            <button type="submit" class="btn btn-netflix w-100">PUBLISH TO BOOKFLIX</button>
        </form>
    </div>
</div>