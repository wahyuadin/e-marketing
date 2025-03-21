<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <form action="{{ route('cabang-detail.store') }}" method="post">
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
                                <label class="form-label">Cabang</label>
                                <input type="text" class="form-control" id="cabang" value="{{ $data->cabang }}" readonly>
                                <input type="hidden" name="cabang_id" value="{{ $data->id }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Karyawan</label>
                                <select id="karyawanSelect" class="form-select">
                                    <option value="">== Pilih Karyawan ==</option>
                                    @foreach (App\Models\Karyawan::all() as $karyawan)
                                        <option value="{{ $karyawan->id }}" data-nama="{{ $karyawan->nama_karyawan ?? '-' }}" data-jabatan="{{ $karyawan->jabatan->jabatan ?? '-' }}">
                                            {{ $karyawan->nama_karyawan }} [{{ $karyawan->jabatan->jabatan }}]
                                        </option>
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
                                            <th>Cabang</th>
                                            <th>Nama Karyawan</th>
                                            <th>Jabatan</th>
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
        let karyawanSelect = document.getElementById('karyawanSelect');
        let selectedOption = karyawanSelect.options[karyawanSelect.selectedIndex];

        if (!selectedOption.value) {
            alert("Pilih karyawan terlebih dahulu!");
            return;
        }

        let nama = selectedOption.dataset.nama;
        let jabatan = selectedOption.dataset.jabatan;
        let id = selectedOption.value;
        let cabang = document.getElementById('cabang').value;

        let tbody = document.querySelector("#modalTable tbody");

        // Cek apakah karyawan sudah ada di tabel
        let existing = Array.from(tbody.children).some(row => row.querySelector('input[name="karyawan_id[]"]').value === id);
        if (existing) {
            alert("Karyawan ini sudah ditambahkan!");
            return;
        }

        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td class="text-center"></td>
            <td>${cabang}</td>
            <td>${nama}</td>
            <td>${jabatan}</td>
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm delete-row">
                    <i class="bi bi-trash-fill"></i>
                </button>
            </td>
            <input type="hidden" name="karyawan_id[]" value="${id}">
        `;

        tbody.appendChild(newRow);
        updateRowNumbers();
        document.getElementById('saveChangesBtn').disabled = false;
        karyawanSelect.value = "";
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
