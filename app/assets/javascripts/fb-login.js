window.fbAsyncInit = function() {
  FB.init({
    appId      : '363735017412279',
    cookie     : true,
    xfbml      : true,
    version    : 'v2.10'
  });

  FB.AppEvents.logPageView();   

};

(function(d, s, id){
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) {return;}
 js = d.createElement(s); js.id = id;
 js.src = "https://connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function statusChangeCallback(response){
}


function checkLoginState() {
  FB.getLoginStatus(function(response){
    if(response.status === "connected"){
      console.log("FB user connected");
      fbConnectApi(response);  //not magic
    } else if (response.status === "not_authorized"){
      console.log("FB user refusal");
    } else {
      console.log("user not logged in to FB");
    }
  });
}

function fbConnectApi(response){
  console.log("do stuff with FB API");
  FB.api('/me', function(response){
    const welcomeMessage = response.name;
    document.getElementById('user-status-msg').innerHTML =
      welcomeMessage;
  });
  return 1;
}
