<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <form action="{{ route('wilayah-detail.store') }}" method="post">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Wilayah</label>
                                <input type="text" class="form-control" id="wilayah" value="{{ $title->wilayah }}"
                                    readonly>
                                <input type="hidden" name="wilayah_id" value="{{ $title->id }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Medical Representative</label>
                                <select id="mrSelect" class="form-select">
                                    <option value="">== Pilih MR ==</option>
                                    @php
                                        $mr = App\Models\User::where('role', 'MR')->get();
                                    @endphp
                                    @foreach ($mr as $item)
                                        <option value="{{ $item->id }}">{{ $item->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button type="button" class="btn btn-success btn-sm" id="addDataBtn">Tambah Data</button>
                        </div>
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table id="modalTable" class="table table-bordered table-hover mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th style="width: 5%">No</th>
                                            <th style="width: 25%">Wilayah</th>
                                            <th style="width: 60%">Medical Representative</th>
                                            <th style="width: 10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="saveChangesBtn" disabled>Save changes</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    document.getElementById('addDataBtn').addEventListener('click', function() {
        let mrSelect = document.getElementById('mrSelect');
        let selectedOption = mrSelect.options[mrSelect.selectedIndex];

        if (!selectedOption.value) {
            alert("Pilih Medical Representative terlebih dahulu!");
            return;
        }

        let mr = selectedOption.text;
        let mrId = selectedOption.value;
        let wilayah = document.getElementById('wilayah').value;
        let wilayahId = document.querySelector('input[name="wilayah_id"]').value;

        let tbody = document.querySelector("#modalTable tbody");

        // Cek apakah MR sudah ada di tabel
        let existing = Array.from(tbody.children).some(row => row.querySelector('input[name="mr_id[]"]')
            .value === mrId);
        if (existing) {
            alert("Medical Representative ini sudah ditambahkan!");
            return;
        }

        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td class="text-center"></td>
            <td>${wilayah}</td>
            <td>${mr}</td>
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm delete-row">
                    <i class="bi bi-trash-fill"></i>
                </button>
            </td>
            <input type="hidden" name="wilayah_id" value="${wilayahId}">
            <input type="hidden" name="mr_id[]" value="${mrId}">
        `;

        tbody.appendChild(newRow);
        updateRowNumbers();
        document.getElementById('saveChangesBtn').disabled = false;
        mrSelect.value = "";
    });

    document.querySelector("#modalTable tbody").addEventListener("click", function(e) {
        if (e.target.closest(".delete-row")) {
            e.target.closest("tr").remove();
            updateRowNumbers();
            document.getElementById('saveChangesBtn').disabled = document.querySelector("#modalTable tbody")
                .children.length === 0;
        }
    });

    function updateRowNumbers() {
        document.querySelectorAll("#modalTable tbody tr").forEach((row, index) => {
            row.querySelector("td.text-center").innerText = index + 1;
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('saveChangesBtn').disabled = true;
    });
</script>
