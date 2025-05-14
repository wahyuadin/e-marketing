<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo mb-3">
        <a href="" class="app-brand-link">
            <img src="{{ asset('assets/logo.png') }}" alt="" height="60">
            <span class="app-brand-text menu-text fw-bolder ms-2" style="font-size: 20px">E-Reporting</span>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
        <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
                <a href="{{ route('dashboard-superadmin.index') }}" class="menu-link">
                    <i class="menu-icon tf-icons bi bi-house-door"></i>
                    <div data-i18n="Analytics">Dashboard</div>
                </a>
            </li>
            <li class="menu-header small text-uppercase">
                <span class="menu-header-text">Master</span>
            </li>

            <li class="menu-item {{ Request::is('master-data/*') ? 'open active' : '' }}">
                <a href="javascript:void(0);" class="menu-link menu-toggle">
                    <i class="menu-icon tf-icons bi bi-files"></i>
                    <div data-i18n="Account Settings">Master Data</div>
                </a>
                <ul class="menu-sub">
                    <li class="menu-item {{ Request::is('master-data/karyawan*') ? 'active' : '' }}">
                        <a href="{{ route('karyawan.index') }}" class="menu-link">
                            <div data-i18n="Account">Karyawan</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/dokter*') ? 'active' : '' }}">
                        <a href="{{ route('dokter.index') }}" class="menu-link">
                            <div data-i18n="Account">Dokter</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/instansi*') ? 'active' : '' }}">
                        <a href="{{ route('instansi.index') }}" class="menu-link">
                            <div data-i18n="Account">Outlet</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/spesialis*') ? 'active' : '' }}">
                        <a href="{{ route('spesialis.index') }}" class="menu-link">
                            <div data-i18n="Account">Spesialis</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/area*') ? 'active' : '' }}">
                        <a href="{{ route('area.index') }}" class="menu-link">
                            <div data-i18n="Account">Area</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/wilayah*') ? 'active' : '' }}">
                        <a href="{{ route('wilayah.index') }}" class="menu-link">
                            <div data-i18n="Account">Cabang</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/regional*') ? 'active' : '' }}">
                        <a href="{{ route('regional.index') }}" class="menu-link">
                            <div data-i18n="Account">Regional</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/rekapitulasi*') ? 'active' : '' }}">
                        <a href="{{ route('rekapitulasi.index') }}" class="menu-link">
                            <div data-i18n="Account">Rekapitulasi Master</div>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="menu-header small text-uppercase">
                <span class="menu-header-text">Report</span>
            </li>
            <li class="menu-item {{ Request::is('daily*') ? 'active' : '' }}">
                <a href="{{ route('daily-visit.index') }}" class="menu-link menu-link">
                    <i class="menu-icon tf-icons bi bi-calendar-check"></i>
                    <div data-i18n="Account Settings">Daily Visit</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('absensi*') ? 'active' : '' }}">
                <a href="{{ route('absensi.index') }}" class="menu-link">
                    <i class="menu-icon fa-solid fa-fingerprint"></i>
                    <div data-i18n="Data User">Absensi</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('pengajuan-dokter*') ? 'active' : '' }}">
                <a href="{{ route('pengajuan-dokter.index') }}" class="menu-link">
                    <i class="menu-icon fa-solid fa-user-doctor"></i>
                    <div data-i18n="Data User">Pengajuan Dokter</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('self-schedule*') ? 'active' : '' }}">
                <a href="{{ route('self-schedule.index') }}" class="menu-link">
                    <i class="menu-icon bi bi-calendar2-day"></i>
                    <div data-i18n="Data User">Self Schedule</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('daftar-laporan*') ? 'active' : '' }}">
                <a href="{{ route('daftar-laporan.index') }}" class="menu-link">
                    <i class="menu-icon fas fa-chart-area"></i>
                    <div data-i18n="Data User">Daftar Laporan</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('pengumuman*') ? 'active' : '' }}">
                <a href="{{ route('pengumuman.index') }}" class="menu-link">
                    <i class="menu-icon fa-solid fa-bullhorn"></i>
                    <div data-i18n="Data User">Pengumuman</div>
                </a>
            </li>
            <li class="menu-item {{ Request::is('approval*') ? 'active' : '' }}">
                <a href="{{ route('approval-history.index') }}" class="menu-link">
                    <i class="menu-icon fa-solid fa-clock-rotate-left"></i>
                    <div data-i18n="Data User">Approval History</div>
                </a>
            </li>
            <li class="menu-header small text-uppercase">
                <span class="menu-header-text">Konfigurasi</span>
            </li>
            <li class="menu-item {{ Request::is('whatsapp*') ? 'active' : '' }}">
                <a href="{{ route('whatsapp.index') }}" class="menu-link">
                    <i class="menu-icon fa-brands fa-whatsapp"></i>
                    <div data-i18n="Data User">WhatsApps</div>
                </a>
            </li>
            <li class="menu-header small text-uppercase">
                <span class="menu-header-text">Bug Report</span>
            </li>
            <li class="menu-item {{ Request::is('bug-report*') ? 'active' : '' }}">
                <a href="{{ route('bug-report.index') }}" class="menu-link">
                    <i class="menu-icon fas fa-bug"></i>
                    <div data-i18n="Analytics">Bug Report</div>
                </a>
            </li>
        </ul>
    @else
        <ul class="menu-inner py-1">
            <!-- Dashboard -->
            @if (Auth::user()->role == 'am')
                <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
                    <a href="{{ route('dashboard-am.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bi bi-house-door"></i>
                        <div data-i18n="Analytics">Dashboard</div>
                    </a>
                </li>
            @endif
            @if (Auth::user()->role == 'nsm')
                <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
                    <a href="{{ route('dashboard-nsm.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bi bi-house-door"></i>
                        <div data-i18n="Analytics">Dashboard</div>
                    </a>
                </li>
            @endif
            @if (Auth::user()->role == 'mr')
                <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
                    <a href="{{ route('dashboard-mr.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bi bi-house-door"></i>
                        <div data-i18n="Analytics">Dashboard</div>
                    </a>
                </li>
            @endif
            @if (Auth::user()->role == 'rsm')
                <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
                    <a href="{{ route('dashboard-rsm.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bi bi-house-door"></i>
                        <div data-i18n="Analytics">Dashboard</div>
                    </a>
                </li>
            @endif
            @if (\App\Models\Absensi::where('user_id', Auth::user()->id)->whereDate('tanggal', \Carbon\Carbon::today())->exists())
                @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                    <li class="menu-header small text-uppercase">
                        <span class="menu-header-text">Master</span>
                    </li>

                    <li class="menu-item {{ Request::is('master-data/*') ? 'open active' : '' }}">
                        <a href="javascript:void(0);" class="menu-link menu-toggle">
                            <i class="menu-icon tf-icons bi bi-files"></i>
                            <div data-i18n="Account Settings">Master Data</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item {{ Request::is('master-data/karyawan*') ? 'active' : '' }}">
                                <a href="{{ route('karyawan.index') }}" class="menu-link">
                                    <div data-i18n="Account">Karyawan</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/dokter*') ? 'active' : '' }}">
                                <a href="{{ route('dokter.index') }}" class="menu-link">
                                    <div data-i18n="Account">Dokter</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/instansi*') ? 'active' : '' }}">
                                <a href="{{ route('instansi.index') }}" class="menu-link">
                                    <div data-i18n="Account">Outlet</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/spesialis*') ? 'active' : '' }}">
                                <a href="{{ route('spesialis.index') }}" class="menu-link">
                                    <div data-i18n="Account">Spesialis</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/area*') ? 'active' : '' }}">
                                <a href="{{ route('area.index') }}" class="menu-link">
                                    <div data-i18n="Account">Area</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/wilayah*') ? 'active' : '' }}">
                                <a href="{{ route('wilayah.index') }}" class="menu-link">
                                    <div data-i18n="Account">Cabang</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/regional*') ? 'active' : '' }}">
                                <a href="{{ route('regional.index') }}" class="menu-link">
                                    <div data-i18n="Account">Regional</div>
                                </a>
                            </li>
                            <li class="menu-item {{ Request::is('master-data/rekapitulasi*') ? 'active' : '' }}">
                                <a href="{{ route('rekapitulasi.index') }}" class="menu-link">
                                    <div data-i18n="Account">Rekapitulasi Master</div>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif

                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Report</span>
                </li>
                @if (Auth::user()->role != 'nsm' && Auth::user()->role != 'rsm')
                    <li class="menu-item {{ Request::is('daily*') ? 'active' : '' }}">
                        <a href="{{ route('daily-visit.index') }}" class="menu-link menu-link">
                            <i class="menu-icon tf-icons bi bi-calendar-check"></i>
                            <div data-i18n="Account Settings">Daily Visit</div>
                        </a>
                    </li>
                @endif
                <li class="menu-item {{ Request::is('absensi*') ? 'active' : '' }}">
                    <a href="{{ route('absensi.index') }}" class="menu-link">
                        <i class="menu-icon fa-solid fa-fingerprint"></i>
                        <div data-i18n="Data User">Absensi</div>
                    </a>
                </li>
                @if (Auth::user()->role != 'nsm' && Auth::user()->role != 'rsm')
                    <li class="menu-item {{ Request::is('pengajuan-dokter*') ? 'active' : '' }}">
                        <a href="{{ route('pengajuan-dokter.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-user-doctor"></i>
                            <div data-i18n="Data User">Pengajuan Dokter</div>
                        </a>
                    </li>
                @endif
                @if (Auth::user()->role != 'nsm' && Auth::user()->role != 'rsm')
                    <li class="menu-item {{ Request::is('self-schedule*') ? 'active' : '' }}">
                        <a href="{{ route('self-schedule.index') }}" class="menu-link">
                            <i class="menu-icon bi bi-calendar2-day"></i>
                            <div data-i18n="Data User">Self Schedule</div>
                        </a>
                    </li>
                @endif
                @if (Auth::user()->role == 'am' ||
                        Auth::user()->role == 'superadmin' ||
                        Auth::user()->role == 'admin' ||
                        Auth::user()->role == 'nsm' ||
                        Auth::user()->role == 'rsm')
                    <li class="menu-item {{ Request::is('daftar-laporan*') ? 'active' : '' }}">
                        <a href="{{ route('daftar-laporan.index') }}" class="menu-link">
                            <i class="menu-icon fas fa-chart-area"></i>
                            <div data-i18n="Data User">Daftar Laporan</div>
                        </a>
                    </li>
                @endif
                @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                    <li class="menu-item {{ Request::is('pengumuman*') ? 'active' : '' }}">
                        <a href="{{ route('pengumuman.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-bullhorn"></i>
                            <div data-i18n="Data User">Pengumuman</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('approval*') ? 'active' : '' }}">
                        <a href="{{ route('approval-history.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-clock-rotate-left"></i>
                            <div data-i18n="Data User">Approval History</div>
                        </a>
                    </li>
                    <li class="menu-header small text-uppercase">
                        <span class="menu-header-text">Konfigurasi</span>
                    </li>
                    <li class="menu-item {{ Request::is('whatsapp*') ? 'active' : '' }}">
                        <a href="{{ route('whatsapp.index') }}" class="menu-link">
                            <i class="menu-icon fa-brands fa-whatsapp"></i>
                            <div data-i18n="Data User">WhatsApps</div>
                        </a>
                    </li>
                @endif
                @if (Auth::user()->role == 'rsm' || Auth::user()->role == 'nsm')
                    <li class="menu-item {{ Request::is('pengumuman*') ? 'active' : '' }}">
                        <a href="{{ route('pengumuman.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-bullhorn"></i>
                            <div data-i18n="Data User">Pengumuman</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('approval*') ? 'active' : '' }}">
                        <a href="{{ route('approval-history.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-clock-rotate-left"></i>
                            <div data-i18n="Data User">Approval History</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/karyawan*') ? 'active' : '' }}">
                        <a href="{{ route('karyawan.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-user-tie"></i>
                            <div data-i18n="Data User">Data Karyawan</div>
                        </a>
                    </li>
                    <li class="menu-item {{ Request::is('master-data/rekapitulasi*') ? 'active' : '' }}">
                        <a href="{{ route('rekapitulasi.index') }}" class="menu-link">
                            <i class="menu-icon fa-solid fa-table-list"></i>
                            <div data-i18n="Data User">Rekapitulasi Master</div>
                        </a>
                    </li>
                @endif
            @else
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Report</span>
                </li>

                <li class="menu-item {{ Request::is('absensi*') ? 'active' : '' }}">
                    <a href="{{ route('absensi.index') }}" class="menu-link">
                        <i class="menu-icon fa-solid fa-fingerprint"></i>
                        <div data-i18n="Data User">Absensi</div>
                    </a>
                </li>
            @endif
            <li class="menu-item {{ Request::is('bug-report*') ? 'active' : '' }}">
                <a href="{{ route('bug-report.index') }}" class="menu-link">
                    <i class="menu-icon fas fa-bug"></i>
                    <div data-i18n="Analytics">Bug Report</div>
                </a>
            </li>
        </ul>
    @endif
</aside>
