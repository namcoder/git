@if(count($menu->getChild) > 0)
    <ul class="dl-submenu">
        @foreach($menu->getChild as $menu)
            <li>
                <a href="{{WbUrl::createUrl($menu->cat_id, 'category')}}">
                    {{$menu->getName($menu->cat_id)}}
                    @if(count($menu->getChild) > 0)
                       <i style="margin-left: 10px;" class="fa fa-caret-right" aria-hidden="true"></i>
                    @endif
                </a>
                @include('theme.'.$theme.'.master.menu.child')
            </li>
        @endforeach
    </ul>
@endif


