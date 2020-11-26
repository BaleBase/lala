## Activity File: Using curl

In this activity, you will continue in your role as a web application security engineer.

- You are tasked with writing various `curl` commands to interact with an HTTP web server. 

- You will use various `curl` options, request methods, and request headers to return specific responses.

Use the provided [`curl` Reference Sheet](./cURL_Reference.md) as a reference for your activity.

### Instructions

You will use `curl` commands to send HTTP requests to the site httpbin.org.

After constructing and testing each `curl` command, answer the questions that follow.

1. Sending a GET Request

    - Run a GET request to httpbin.org/anything.

    - What is returned by this request? Is there anything that identifies the requestor?

2. Retrieving Response Headers

    - Run a GET request to httpbin.org with an added `curl` argument to display response headers.

    - What is the content-type for this page?

3. Retrieving New Response Headers

    - Run a GET request to httpbin.org/anything with an added `curl` argument to display response headers.

    - What is the content-type for this page?

4. Sending a POST Request

    - Run a POST request that enters `'{"Developer": "Andrew"}'` for the data argument.
    
   - Under what JSON object does the posted data appear?

5. Setting Parameters

    - Run a POST request with an added parameters `?EmployeeDirectory=frontend`.

    - After the parameters go through, where do they appear in the JSON response body?

6. Setting Headers

    - Run the same POST as above with an added header: `-H "Content-Type: application/json"`.

    - Where does the data end up?


### Solutions

Using `curl`

The goal of this activity was to get familiar with the command-line tool `curl`. It's important to note that `curl` is one of the most widely used tools by security professionals for investigating HTTP requests and responses.

---

1. Sending a GET Request

    - Run a GET request to httpbin.org/anything:
        - `curl https://httpbin.org/anything`

    - What is returned by this request? Is there anything that identifies the requestor?
        - A JSON response body was received that shows requestor information, such as the requestor's IP address.

2. Retrieving Response Headers

    - Run a GET request to httpbin.org with an added `curl` argument to display response headers:
        - `curl https://httpbin.org/ --head`

      - What is the content-type for this page?
        - The content-type is HTML.

3. Retrieving New Response Headers

    - Run a GET request to httpbin.org/anything with an added `curl` argument to display response headers: 
        - `curl https://httpbin.org/anything --head`

    - What is the content-type for this page?
        - The content-type is JSON.

4. Sending a POST Request

    - Run a POST request that enters `'{"Developer": "Andrew"}'` for the data argument:
        - `curl -X POST "https://httpbin.org/anything" -d '{"Developer": "Andrew"}'`

     - Under what JSON object does the posted data appear?
        - The data appears under the `form` JSON object.

5. Setting Parameters

    - Run a POST request with an added parameters `?EmployeeDirectory=frontend`:
        - `curl -X POST "https://httpbin.org/anything?EmployeeDirectory=frontend"`

    - After the parameters go through, where do they appear in the JSON response body?
        - The parameters appears under the `args` JSON object.

6. Setting Headers

    - Run the same POST as above with an added header: `-H "Content-Type: application/json"`:

        - `curl -X POST "https://httpbin.org/anything" -d '{"Developer": "Andrew"}' -H "Content-Type: application/json"`
    - Where does the data end up?
        - Setting the JSON content-type made it so the JSON appeared under `json`.

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

