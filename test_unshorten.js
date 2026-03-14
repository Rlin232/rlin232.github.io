async function testUnshorten() {
    try {
        // test unshortening a generic redirect
        const url = "http://google.com";
        const proxiedUrl = `https://api.allorigins.win/get?url=${encodeURIComponent(url)}`;
        const res = await fetch(proxiedUrl);
        const data = await res.json();
        console.log("Final URL:", data.status.url);
    } catch (e) {
        console.error(e);
    }
}
testUnshorten();
