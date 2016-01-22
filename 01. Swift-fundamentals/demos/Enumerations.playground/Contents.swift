enum HttpResponse{
    case Success(status:Int )
    case Error
}

let response = HttpResponse.Success;

switch response {
case .Success(200):
    print("Success");
case .Success(201):
    print("Created");
default:
    print("Unknown");
}
