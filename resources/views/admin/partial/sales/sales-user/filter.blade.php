<div class="modal-content">
    <form id="filterForm">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="start_date" class="form-label">Dari Tanggal <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="start_date" name="start_date" value="{{ date('Y-m-d', strtotime('-1 month')) }}">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="end_date" class="form-label">Sampai Tanggal <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="end_date" name="end_date" value="{{ date('Y-m-d') }}">
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">Tutup</button>
            <button type="submit" class="btn btn-warning rounded-pill" data-bs-dismiss="modal">Filter</button>
        </div>
    </form>
</div>
