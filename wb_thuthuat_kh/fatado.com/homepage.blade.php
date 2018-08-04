@if($slider)
    @php
        $position = $slider['config']->website->text_position;
        $slider_width = (!empty($slider['config']->website->width))?$slider['config']->website->width . 'px':'auto';
        $slider_height = (!empty($slider['config']->website->height))?$slider['config']->website->height . 'px':'auto';
    @endphp
    <style>
        .wb-slider .wb-thumb img {
            width: {{@$slider_width}};
            height: {{@$slider_height}};
        }
    </style>
    <div class="home-slider-section section wb-mb-50" style="{{Widget::renderStyle(@$stylesheet)}}">
        @if($title)
             <div class="heading-part mb_10 ">
                @sections('widget_title', ['title' => $title, 'class' => 'main_title'])
            </div>
        @endif
        @if(count($slider['images']))
            <div class="wb-slider">
                <div class="owl-carousel owl-theme wb-owl" data-responsive='{"0":{"items":1}}'
                     data-navtext='["<i class=\"fa fa-angle-left\"><\/i>","<i class=\"fa fa-angle-right\"><\/i>"]'
                @foreach($slider['config']->js_library as $key => $value)
                    {{'data-' .$key. '=' . $value}}
                        @endforeach
                >
                    @foreach($slider['images'] as $slider_image)
                        <div class="item-slider item-slider-{{$position}}">
                            <div class="wb-thumb">
                                <a href="{{$slider_image['href']}}" {{ $slider_image['is_new_tab'] ? 'target="_blank"' : '' }}>
                                    {{-- {!! showImageLazy($slider_image['src'],null, unSpecialCharacters($slider_image['alt']),'owl-lazy') !!} --}}
                                    <img src="{{ getThumbnail($slider_image['src'], '') }}" alt="">
                                </a>
                            </div>
                            @if( $slider_image['text1'] || $slider_image['text2'] || $slider_image['text3'] )
                                <div class="wb-info text-center text-uppercase animated wb-text-{{$position}}"
                                     data-animated="{{$slider['config']->website->text_animation or ''}}">
                                    <p class="wb-animate-text1">{{$slider_image['text1'] or ''}}</p>
                                    <p class="wb-animate-text2 animated"
                                       data-animated="flash">{{$slider_image['text2'] or ''}}</p>
                                    <p class="wb-animate-text3"> {{$slider_image['text3'] or ''}}</p>
                                </div>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
    </div>
@endif
