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
                                <label class="form-label">Cabang</label>
                                <input type="text" class="form-control" id="wilayah" value="{{ $title->wilayah }}"
                                    readonly>
                                <input type="hidden" name="wilayah_id" value="{{ $title->id }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Code Cabang</label>
                                <input type="text" class="form-control" id="code_wilayah" value="{{ $title->code }}"
                                    readonly>
                                @php
                                    $code_mr = App\Models\WilayahDetail::where('wilayah_id', $title->id)->count();
                                @endphp
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Medical Representative</label>
                                <select id="mrSelect" class="form-select select2">
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
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Area</label>
                                <select id="areaSelect" class="form-select select2">
                                    <option value="">== Pilih Area ==</option>
                                    @php
                                        $area = App\Models\Area::all();
                                    @endphp
                                    @foreach ($area as $itemArea)
                                        <option value="{{ $itemArea->id }}">{{ $itemArea->area }}</option>
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
                                            <th style="width: 30%">Medical Representative</th>
                                            <th style="width: 20%">Area</th>
                                            <th style="width: 10%">Code MR</th>
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
@push('scripts')
    <script>
        $(document).ready(function() {
            $('.select2').select2({
                dropdownParent: $('#addData'),
                placeholder: "--- Pilih Salah Satu ---",
                theme: 'bootstrap-5'
            });
        });
    </script>
@endpush
<script>
    let codeMrBase = document.getElementById('code_wilayah').value + ".";

    function getAlphabet(index) {
        return String.fromCharCode(65 + index); // 0 -> A, 1 -> B, ...
    }


    document.getElementById('addDataBtn').addEventListener('click', function() {
        let mrSelect = document.getElementById('mrSelect');
        let areaSelect = document.getElementById('areaSelect');

        let selectedMrOption = mrSelect.options[mrSelect.selectedIndex];
        let selectedAreaOption = areaSelect.options[areaSelect.selectedIndex];

        if (!selectedMrOption.value || !selectedAreaOption.value) {
            alert("Pilih Medical Representative dan Area terlebih dahulu!");
            return;
        }

        let mr = selectedMrOption.text;
        let mrId = selectedMrOption.value;
        let area = selectedAreaOption.text;
        let areaId = selectedAreaOption.value;

        let wilayah = document.getElementById('wilayah').value;
        let wilayahId = document.querySelector('input[name="wilayah_id"]').value;

        let tbody = document.querySelector("#modalTable tbody");

        // Cek apakah MR sudah ada di tabel
        let existing = Array.from(tbody.children).some(row =>
            row.querySelector('input[name="mr_id[]"]').value === mrId
        );
        if (existing) {
            alert("Medical Representative ini sudah ditambahkan!");
            return;
        }

        let alphabet = getAlphabet(@json($code_mr));
        let codeMR = codeMrBase + alphabet;
        let newRow = document.createElement("tr");

        newRow.innerHTML = `
            <td class="text-center"></td>
            <td>${wilayah}</td>
            <td>${mr}</td>
            <td>${area}</td>
            <td>${codeMR}</td>
            <td class="text-center">
                <button type="button" class="btn btn-danger btn-sm delete-row">
                    <i class="bi bi-trash-fill"></i>
                </button>
            </td>
            <input type="hidden" name="wilayah_id" value="${wilayahId}">
            <input type="hidden" name="mr_id[]" value="${mrId}">
            <input type="hidden" name="code[]" value="${codeMR}">
            <input type="hidden" name="area_id[]" value="${areaId}">
        `;

        tbody.appendChild(newRow);
        updateRowNumbers();

        document.getElementById('saveChangesBtn').disabled = false;

        mrSelect.value = "";
        areaSelect.value = "";
    });

    document.querySelector("#modalTable tbody").addEventListener("click", function(e) {
        if (e.target.closest(".delete-row")) {
            e.target.closest("tr").remove();
            updateRowNumbers();
            document.getElementById('saveChangesBtn').disabled =
                document.querySelector("#modalTable tbody").children.length === 0;
        }
    });

    function updateRowNumbers() {
        const rows = document.querySelectorAll("#modalTable tbody tr");
        rows.forEach((row, index) => {
            row.querySelector("td.text-center").innerText = index + 1;
            let newCode = codeMrBase + getAlphabet(@json($code_mr) + index);
            row.querySelector("td:nth-child(5)").innerText = newCode;
            row.querySelector('input[name="code[]"]').value = newCode;
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('saveChangesBtn').disabled = true;
    });
</script>
