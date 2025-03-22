<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo mb-3">
        <a href="" class="app-brand-link">
            <img src="{{ asset('assets/logo.png') }}" alt="" height="60">
            <span class="app-brand-text menu-text fw-bolder ms-2" style="font-size: 20px">E-Reporting</span>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ Request::is('dashboard*') ? 'active' : '' }}">
            <a href="{{ route('dashboard-superadmin.index') }}" class="menu-link">
                <i class="menu-icon tf-icons bi bi-house-door"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
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
                        <div data-i18n="Account">Instansi</div>
                    </a>
                </li>
                <li class="menu-item {{ Request::is('master-data/spesialis*') ? 'active' : '' }}">
                    <a href="{{ route('spesialis.index') }}" class="menu-link">
                        <div data-i18n="Account">Spesialis</div>
                    </a>
                </li>
                <hr>
                <li class="menu-item {{ Request::is('master-data/regional*') ? 'active' : '' }}">
                    <a href="{{ route('regional.index') }}" class="menu-link">
                        <div data-i18n="Account">Regional</div>
                    </a>
                </li>
                <li class="menu-item {{ Request::is('master-data/wilayah*') ? 'active' : '' }}">
                    <a href="{{ route('wilayah.index') }}" class="menu-link">
                        <div data-i18n="Account">Wilayah</div>
                    </a>
                </li>
                <li class="menu-item {{ Request::is('master-data/absensi*') ? 'active' : '' }}">
                    <a href="" class="menu-link">
                        <div data-i18n="Account">Absensi</div>
                    </a>
                </li>
            </ul>
        </li>

        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">Report</span>
        </li>

        <li class="menu-item {{ Request::is('sales/*') ? 'open active' : '' }}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bi bi-cart"></i>
                <div data-i18n="Account Settings">Sales</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item {{ Request::is('sales/dashboard*') ? 'active' : '' }}">
                    <a href="" class="menu-link">
                        <div data-i18n="Account">Dashboard Sales</div>
                    </a>
                </li>
                <li class="menu-item {{ Request::is('sales/sales-harian*') ? 'active' : '' }}">
                    <a href="" class="menu-link">
                        <div data-i18n="Notifications">Sales Harian</div>
                    </a>
                </li>
            </ul>
        </li>

        <li class="menu-item {{ Request::is('daily*') ? 'active' : '' }}">
            <a href="" class="menu-link menu-link">
                <i class="menu-icon tf-icons bi bi-calendar-check"></i>
                <div data-i18n="Account Settings">Daily Visit</div>
            </a>
        </li>
        @if (Auth::user()->accept == true)
            <li class="menu-header small text-uppercase">
                <span class="menu-header-text">Management User</span>
            </li>
            <li class="menu-item {{ Request::is('master-user*') ? 'active' : '' }}">
                <a href="{{ route('master-user.index.admin') }}" class="menu-link">
                    <i class="menu-icon tf-icons bi bi-person"></i>
                    <div data-i18n="Data User">Data User</div>
                </a>
            </li>
        @endif
    </ul>
</aside>
