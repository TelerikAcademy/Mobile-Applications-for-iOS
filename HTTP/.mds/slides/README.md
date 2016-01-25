<!-- section start -->
<!-- attr: { class:'slide-title', showInPresentation:true, style:'' } -->
# HTTP Request in iOS Apps
<div class="signature">
    <p class="signature-course">Telerik Software Academy</p>
    <p class="signature-initiative">http://academy.telerik.com </p>
    <a href = "Mobile apps for iPhone & iPad" class="signature-link">Mobile apps for iPhone & iPad</a>
</div>

<!-- attr: { showInPresentation:true, style:'' } -->
# HTTP Request in iOS Apps
- http://academy.telerik.com 

<!-- attr: { showInPresentation:true, style:'' } -->
# Homework
- Create an abstraction for performing HTTP requests with Objective-C
  - It should support HTTP GET, HTTP POST, HTTP PUT and HTTP DELETE
  - Example:
- [httpRequester get: @"http://url.com" 
-           headers: headersDictionary
-         withTarget: self
-             action: @selector(handleGet)]
- [httpRequester get: @"http://url.com" 
-         withTarget: self
-             action: @selector(handleGet)]
- [httpRequester post: @"http://url.com" 
-                data: data
-          withTarget: self
-              action: @selector(handlePost)]

