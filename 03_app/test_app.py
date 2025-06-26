import app

def test_health():
    tester = app.app.test_client()
    response = tester.get("/health")
    assert response.status_code == 200
    assert response.json["status"] == "ok"
