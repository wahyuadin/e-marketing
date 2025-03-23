<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <form action="{{ route('regional-detail.store') }}" method="post">
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
                                <label class="form-label">Region</label>
                                <input type="text" class="form-control" id="region" value="{{ $title->region }}"
                                    readonly>
                                <input type="hidden" name="region_id" value="{{ $title->id }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Wilayah</label>
                                <select id="wilayahSelect" class="form-select">
                                    <option value="">== Pilih Wilayah ==</option>
                                    @php
                                        $wilayah = App\Models\Wilayah::all();
                                    @endphp
                                    @foreach ($wilayah as $item)
                                        <option value="{{ $item->id }}">{{ $item->wilayah }}</option>
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
                                            <th class="text-center" style="width: 5%">NO</th>
                                            <th style="width: 40%">Region</th>
                                            <th style="width: 40%">Wilayah</th>
                                            <th class="text-center">Action</th>
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
        let wilayahSelect = document.getElementById('wilayahSelect');
        let selectedOption = wilayahSelect.options[wilayahSelect.selectedIndex];

        if (!selectedOption.value) {
            alert("Pilih wilayah terlebih dahulu!");
            return;
        }

        let wilayah = selectedOption.text;
        let wilayahId = selectedOption.value;
        let region = document.getElementById('region').value;
        let regionId = document.querySelector('input[name="region_id"]').value;

        let tbody = document.querySelector("#modalTable tbody");

        // Cek apakah wilayah sudah ada di tabel
        let existing = Array.from(tbody.children).some(row => row.querySelector('input[name="wilayah_id[]"]')
            .value === wilayahId);
        if (existing) {
            alert("Wilayah ini sudah ditambahkan!");
            return;
        }

        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td class="text-center"></td>
            <td>${region}</td>
            <td>${wilayah}</td>
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm delete-row">
                    <i class="bi bi-trash-fill"></i>
                </button>
            </td>
            <input type="hidden" name="wilayah_id[]" value="${wilayahId}">
        `;

        tbody.appendChild(newRow);
        updateRowNumbers();
        document.getElementById('saveChangesBtn').disabled = false;
        wilayahSelect.value = "";
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
