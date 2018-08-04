<style type="text/css">
        .hisella-messages { position: fixed; bottom: 0; left:0px; z-index: 999999; }
        .hisella-messages-outer { position: relative; }
        #hisella-minimize { background: #3b5998; font-size: 14px; color: #fff; padding: 3px 10px; position: absolute; top: -34px; left: -1px; border: 1px solid #E9EAED; cursor: pointer; }
        @media screen and (max-width:768px){ #hisella-facebook { opacity:0; } .hisella-messages { bottom: -300px; right: -135px; } }
        </style>
        <div id="fb-root"></div>
        <script>
        (function($) { 
					
			$(document).ready(function(){ 
	
				$( ".hisella-messages" ).animate( { bottom: "-300px" } ).animate( { right: "-135px" }, 400, function(){ $( "#hisella-facebook" ).css( "opacity", 0 ) } ); 
			
				$( "#hisella-minimize" ).click( function() { 
					if( $( "#hisella-facebook" ).css( "opacity" ) == 0 ) { 
						$( "#hisella-facebook" ).css( "opacity", 1 ); 
						$( ".hisella-messages" ).animate( { right: "0" } ).animate( { bottom: "0" } ); 
					} else { 
						$( ".hisella-messages" ).animate( { bottom: "-300px" } ).animate( { right: "-135px" }, 400, function(){ $( "#hisella-facebook" ).css( "opacity", 0 ) } ); 
					} 
				}) 
			}); 
		})(jQuery);
        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, "script", "facebook-jssdk"));
        </script>
        <div class="hisella-messages"><div class="hisella-messages-outer"><div id="hisella-minimize">Facebook chat</div><div id="hisella-facebook" class="fb-page" data-adapt-container-width="true" data-height="300" data-hide-cover="false" data-href="<?= Info::getInfoField('facebook') ?>" data-show-facepile="true" data-show-posts="false" data-small-header="false" data-tabs="messages" data-width="250"></div></div></div>