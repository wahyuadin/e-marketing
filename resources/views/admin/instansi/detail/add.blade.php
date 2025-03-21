<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <form action="{{ route('instansi-detail.store') }}" method="POST" class="needs-validation" enctype="multipart/form-data">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="instansi" class="form-label">Nama Instansi <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="instansi_id" id="instansi" required
                                    value="{{ $data->instansi }}" placeholder="Masukan Nama Instansi" readonly>
                                <input type="hidden" name="instansi_id" id="instansi_id" value="{{ $data->id }}">

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Dokter <span class="text-danger">*</span></label>
                                @php
                                    $dokter = \App\Models\Dokter::all();
                                @endphp
                                <select name="dokter_id" class="form-select" required>
                                    <option selected disabled>== Pilih Dokter ==</option>
                                    @foreach ($dokter as $item)
                                        <option value="{{ $item->id }}">{{ strtoupper($item->dokter) }} - [{{ strtoupper($item->spesialis->spesialis ?? 'Tidak ada spesialis') }}]</option>
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
                                            <th>Nama Instansi</th>
                                            <th>Dokter</th>
                                            <th class="text-center">Aksi</th>
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
        let dokterSelect = document.querySelector('select[name="dokter_id"]');
        let selectedOption = dokterSelect.options[dokterSelect.selectedIndex];

        if (!selectedOption.value) {
            alert("Pilih dokter terlebih dahulu!");
            return;
        }

        let dokterNama = selectedOption.text;
        let dokterId = selectedOption.value;
        let instansi = document.getElementById('instansi').value;
        let instansi_id = document.getElementById('instansi_id').value;

        let tbody = document.querySelector("#modalTable tbody");

        // Cek apakah dokter sudah ada di tabel
        let existing = Array.from(tbody.children).some(row => row.querySelector('input[name="dokter_id[]"]').value === dokterId);
        if (existing) {
            alert("Dokter ini sudah ditambahkan!");
            return;
        }

        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td class="text-center"></td>
            <td>${instansi}</td>
            <td>${dokterNama}</td>
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm delete-row">
                    <i class="bi bi-trash-fill"></i>
                </button>
            </td>
            <input type="hidden" name="dokter_id[]" value="${dokterId}">
            <input type="hidden" name="instansi_id" value="${instansi_id}">
        `;

        tbody.appendChild(newRow);
        updateRowNumbers();
        document.getElementById('saveChangesBtn').disabled = false;
    });

    document.querySelector("#modalTable tbody").addEventListener("click", function(e) {
        if (e.target.closest(".delete-row")) {
            e.target.closest("tr").remove();
            updateRowNumbers();
            document.getElementById('saveChangesBtn').disabled = document.querySelector("#modalTable tbody").children.length === 0;
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
