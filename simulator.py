from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By

opt = Options()


path = "./chromedriver"

def hello():
    return "hello"

opt.add_experimental_option("prefs", { \
    "profile.default_content_setting_values.media_stream_mic": 1, 
    "profile.default_content_setting_values.media_stream_camera": 1,
})

driver = webdriver.Chrome(path,options=opt)

driver.get("https://class.kavano.org/kavidu/azad-admin/test01")

username = driver.find_element_by_name("usernameOrEmail")
password = driver.find_element_by_name("password")


username.send_keys("azad-user")
password.send_keys("azad-user@123")

driver.find_elements_by_tag_name("button")[0].click()

wait = WebDriverWait(driver,10)
results = wait.until(lambda driver: driver.find_elements_by_class_name('micCamTest__modal'))
driver.find_elements_by_tag_name("button")[2].click()				
results = wait.until(lambda driver: driver.find_elements_by_class_name('c-required-modal__box'))

driver.find_element_by_xpath("//div[@class='text-left']/div/button").click()

for result in results:
    print('-'*80)