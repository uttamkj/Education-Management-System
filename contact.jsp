<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
<style type="text/css">
body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.bg-image {
  background-image: url('https://images.unsplash.com/photo-1596524430615-b46475ddff6e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29udGFjdCUyMHVzfGVufDB8fDB8fHww');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
</style>
</head>
<body>
<div class="container-fluid px-5 my-5">
  <div class="row justify-content-center">
    <div class="col-xl-10">
      <div class="card border-0 rounded-3 shadow-lg overflow-hidden">
        <div class="card-body p-0">
          <div class="row g-0">
            <div class="col-sm-6 d-none d-sm-block bg-image"></div>
            <div class="col-sm-6 p-4">
              <div class="text-center">
                <div class="h3 fw-light">Contact Form</div>
                <p class="mb-4 text-muted">Split layout contact form</p>
              </div>

              <form id="contactForm" action="save_contact" method="post">
    <!-- Name Input -->
    <div class="form-floating mb-3">
        <input class="form-control" id="name" name="name" type="text" placeholder="Name" data-sb-validations="required" />
        <label for="name">Name</label>
        <div class="invalid-feedback" data-sb-feedback="name:required">Name is required.</div>
    </div>

    <!-- Email Input -->
    <div class="form-floating mb-3">
        <input class="form-control" id="emailAddress" name="emailAddress" type="email" placeholder="Email Address" data-sb-validations="required,email" />
        <label for="emailAddress">Email Address</label>
        <div class="invalid-feedback" data-sb-feedback="emailAddress:required">Email Address is required.</div>
        <div class="invalid-feedback" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div>
    </div>

    <!-- Message Input -->
    <div class="form-floating mb-3">
        <textarea class="form-control" id="message" name="message" type="text" placeholder="Message" style="height: 10rem;" data-sb-validations="required"></textarea>
        <label for="message">Message</label>
        <div class="invalid-feedback" data-sb-feedback="message:required">Message is required.</div>
    </div>

    <!-- Submit success message -->
    <div class="d-none" id="submitSuccessMessage">
        <div class="text-center mb-3">
            <div class="fw-bolder">Form submission successful!</div>
            <p>To activate this form, sign up at</p>
            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
        </div>
    </div>

    <!-- Submit error message -->
    <div class="d-none" id="submitErrorMessage">
        <div class="text-center text-danger mb-3">Error sending message!</div>
    </div>

    <!-- Submit button -->
    <div class="d-grid">
        <input type="submit" value="Sign Up">
    </div>
</form>
              <!-- End of contact form -->

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- CDN Link to SB Forms Scripts -->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>