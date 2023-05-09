import Cocoa

var greeting = "Hello, playground"

var code:String = "UsOpc3VsdGF0cyB0csOocyBzYXRpc2ZhaXNhbnRzLiBMZSB0cmF2YWlsIGVzdCBzw6lyaWV1eCBldCBy\nw6lndWxpZXIuIFVuZSB0csOocyBib25uZSBtYWl0cmlzZSBkZXMgY29ubmFpc3NhbmNlcyBldCBkZXMg\nY29tcMOpdGVuY2VzIHNjaWVudGlmaXF1ZXMu"

code.removeAll(where: "\n".contains(_:))

var code1 = Data(base64Encoded: code)

print(String(data: code1!, encoding: .utf8))
