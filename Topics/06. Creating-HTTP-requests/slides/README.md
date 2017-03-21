<!-- section start -->
<!-- attr: { class:'slide-title', hasScriptWrapper:true } -->
# Creating HTTP Requests
##  in iOS 9

<div class="signature">
  <p class="signature-course">Mobile Applications for iPhone and iPad</p>
  <p class="signature-initiative">Telerik Software Academy</p>
  <a href="http://academy.telerik.com" class="signature-link">http://academy.telerik.com</a>
</div>

# Table of Contents

- Creating HTTP Requests
  - The `NSURLRequest` class
  - The `NSURLSession` class
  - Using blocks
- Extracting HTTP functionality in another class
- Creating a Simple application with HTTP

# Creating HTTP requests with Objective-C

```objectivec
NSURL *url = [NSURL URLWithString:urlString];
NSURLRequest *req = [NSMutableURLRequest requestWithURL: url];
[[[NSURLSession sharedSession]
    dataTaskWithRequest:req
      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         if(error){
             NSLog(@"%@", error);
             return;
         }
         NSDictionary *objDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
         NSLog(@"%@", objDict);

   }]
resume];
```

<!-- section start --><!-- attr: { class:'slide-title', hasScriptWrapper:true } --># Creating HTTP Requests## Questions