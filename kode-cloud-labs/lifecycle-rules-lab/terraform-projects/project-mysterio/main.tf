resource "local_file" "file" {
    filename = var.filename
    file_permission =  var.permission
    content = random_string.string.id
    lifecycle {
        create_before_destroy =  false # not always the best rule to use - 2 files cannot be named the same
    }
}

resource "random_string" "string" {
    length = var.length
    keepers = {
        length = var.length
    }  
    
    lifecycle {
        create_before_destroy = true
    }
}
