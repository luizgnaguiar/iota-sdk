package user

import "errors"

type UILanguage string

const (
	UILanguageEN   UILanguage = "en"
	UILanguageRU   UILanguage = "ru"
	UILanguageUZ   UILanguage = "uz"
	UILanguageZH   UILanguage = "zh"
	UILanguagePTBR UILanguage = "pt-BR"
)

func NewUILanguage(l string) (UILanguage, error) {
	language := UILanguage(l)
	if !language.IsValid() {
		return "", errors.New("invalid language")
	}
	return language, nil
}

func (l UILanguage) IsValid() bool {
	switch l {
	case UILanguageEN, UILanguageRU, UILanguageUZ, UILanguageZH, UILanguagePTBR:
		return true
	}
	return false
}
