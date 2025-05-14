@extends('template.app')

@section('content')
    <!-- Overlay loading -->
    <div id="loading-overlay" class="d-none"
        style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.8); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Regional</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData">
                            <i class='bx bx-plus'></i>
                        </button>
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
                            <i class='bx bx-export'></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">Print PDF</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">Export Excel</a>
                            </li>
                        </ul>
                    </div>

                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Regional</th>
                                <th>RSM</th>
                                <th>Cabang</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->region ?? '-' }}</td>
                                    <td>{{ $datas->user->nama ?? '-' }}</td>
                                    <td>
                                        @if ($datas->regiondetails->count() > 0)
                                            <ul>
                                                @foreach ($datas->regiondetails->take(2) as $item)
                                                    <li>{{ $item->wilayah->wilayah ?? '-' }}</li>
                                                @endforeach
                                                @if ($datas->regiondetails->count() > 3)
                                                    <li>...</li>
                                                @endif
                                            </ul>
                                            <div class="all-wilayah-list d-none">
                                                @foreach ($datas->regiondetails as $cabang)
                                                    <div>{{ $cabang->wilayah->wilayah ?? '-' }}</div>
                                                @endforeach
                                            </div>
                                        @else
                                            Tidak Ada Data
                                        @endif
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row gap-2">
                                        @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                            <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}"
                                                class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit"></button>
                                            <a href="{{ route('regional.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                        @endif
                                        <a href="{{ route('regional-detail.show', $datas->id) }}"
                                            class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail"></a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    @include('superadmin.region.add')

    @push('style')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>

        <script>
            new DataTable('#example', {
                lengthMenu: [
                    [10, 25, 50, -1], // Nilai
                    [10, 25, 50, 'All'] // Label
                ],
            });

            function ucwordsJS(str) {
                return str.replace(/_/g, ' ').toLowerCase().replace(/\b\w/g, c => c.toUpperCase());
            }

            function getCellText(html) {
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = html;

                const wilayahList = tempDiv.querySelector('.all-wilayah-list');
                if (wilayahList) {
                    return Array.from(wilayahList.querySelectorAll('div')).map(div => div.textContent.trim()).join('\n');
                }

                const listItems = tempDiv.querySelectorAll('li');
                if (listItems.length) {
                    return Array.from(listItems).map(li => li.textContent.trim()).join('\n');
                }

                return tempDiv.textContent.trim();
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');
                const {
                    jsPDF
                } = window.jspdf;
                const doc = new jsPDF();

                const title = "Data Regional E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                const pageWidth = doc.internal.pageSize.width;
                const titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                const table = $('#example').DataTable();
                const headers = [];

                $('#example thead th').each(function(index) {
                    if (index < 4) {
                        headers.push($(this).text().trim());
                    }
                });

                const data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    const row = this.node();
                    const cells = $('td', row);
                    const rowData = [];

                    cells.each(function(index) {
                        if (index < headers.length) {
                            const html = $(this).html();
                            const text = getCellText(html);
                            rowData.push(ucwordsJS(text));
                        }
                    });

                    data.push(rowData);
                });

                doc.autoTable({
                    head: [headers],
                    body: data,
                    startY: 20,
                    theme: "striped",
                    styles: {
                        fontSize: 8,
                        textColor: [0, 0, 0]
                    },
                    headStyles: {
                        fillColor: [192, 192, 192],
                        textColor: [0, 0, 0]
                    },
                });

                doc.save("Data_Regional.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const table = $('#example').DataTable();
                const headers = [];

                $('#example thead th').each(function(index) {
                    if (index < 4) {
                        headers.push($(this).text().trim());
                    }
                });

                const data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    const row = this.node();
                    const cells = $('td', row);
                    const rowData = [];

                    cells.each(function(index) {
                        if (index < headers.length) {
                            const html = $(this).html();
                            const text = getCellText(html);
                            rowData.push(ucwordsJS(text));
                        }
                    });

                    data.push(rowData);
                });

                const ws_data = [headers, ...data];
                const ws = XLSX.utils.aoa_to_sheet(ws_data);

                ws['!cols'] = ws_data[0].map((_, colIndex) => {
                    let maxWidth = 10;
                    ws_data.forEach(row => {
                        const cell = row[colIndex];
                        if (cell && cell.length > maxWidth) maxWidth = cell.length;
                    });
                    return {
                        wch: maxWidth + 2
                    };
                });

                const wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Data Regional");
                XLSX.writeFile(wb, "Data_Regional.xlsx");

                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
