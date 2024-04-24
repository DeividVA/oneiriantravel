using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using Ink.Parsed;
using Story = Ink.Runtime.Story;
using Choice = Ink.Runtime.Choice;
using UnityEngine.SceneManagement;
//using Text = UnityEngine.UI.Text;

public class InkManager : MonoBehaviour
{


    [SerializeField]
    private TextAsset _inkJsonAsset;
    private Story _story;

    [SerializeField]
    private TextMeshProUGUI _textField;

    [SerializeField]
    private VerticalLayoutGroup _choiceButtonContainer;

    [SerializeField]
    private Button _choiceButtonPrefab;

    [SerializeField]
    private Color _normalTextColor;

    [SerializeField]
    private Color _thoughtTextColor;

    private CharacterManager _characterManager;

    private BackgroundManager _backgroundManager;

    private ItemManager _itemManager;

    private HudManager _hudManager;

    private int _deltaWaves;

    [SerializeField]
    private TextMeshProUGUI _deltaPointsText;

    private CTManager _ctManager;


    public int DeltaWaves
    {
        get => _deltaWaves;
        private set
        {
            Debug.Log($"Updating Delta Waves value. Old value: {_deltaWaves}, new value: {value}");
            _deltaWaves = value;
            _deltaPointsText.text = DeltaWaves.ToString();
        }
    }

    public static InkManager Instance;

    // Start is called before the first frame update
    void Start()
    {
        _characterManager = FindObjectOfType<CharacterManager>();
        _backgroundManager = FindObjectOfType<BackgroundManager>();
        _itemManager = FindObjectOfType<ItemManager>();
        _hudManager = FindObjectOfType<HudManager>();
        _ctManager = FindObjectOfType<CTManager>();

        StartStory();

        InitializeVariables();

    }

    private void StartStory()
    {
        _story = new Story(_inkJsonAsset.text);

        _story.BindExternalFunction("ShowCharacter", (string name, string position, string mood)
          => _characterManager.ShowCharacter(name, position, mood));

        _story.BindExternalFunction("HideCharacter", (string name)
          => _characterManager.HideCharacter(name));

        _story.BindExternalFunction("ChangeMood", (string name, string mood)
          => _characterManager.ChangeMood(name, mood));

        _story.BindExternalFunction("ShowBackground", (string name)
          => _backgroundManager.ShowBackground(name));

        _story.BindExternalFunction("HideBackground", (string name)
          => _backgroundManager.HideBackground(name));

        _story.BindExternalFunction("ShowItem", (string name)
          => _itemManager.ShowItem(name));

        _story.BindExternalFunction("HideItem", ()
          => _itemManager.HideItem());

        _story.BindExternalFunction("ShowHud", ()
          => _hudManager.ShowHud());

        _story.BindExternalFunction("HideHud", ()
          => _hudManager.HideHud());

        _story.BindExternalFunction("ShowCT", ()
          => _ctManager.ShowCT());

        _story.BindExternalFunction("HideCT", ()
          => _ctManager.HideCT());

        DisplayNextLine();

    }


    private void InitializeVariables()
    {
        DeltaWaves = (int)_story.variablesState["DeltaWaves"];

        _story.ObserveVariable("DeltaWaves", (arg, value) =>
        {
            DeltaWaves = (int)value;
            _deltaPointsText.text = DeltaWaves.ToString();
        });
    }

    public int ShowVariablesValue() 
    {
        return DeltaWaves;
    }

    public void DisplayNextLine()
    {
        if (_story.canContinue)
        {
            string text = _story.Continue(); //gets next line
            text = text?.Trim(); //removes white space from text
            ApplyStyling();
            _textField.text = text; //displays new text

        }
        else if  (_story.currentChoices.Count > 0)
        {
            DisplayChoices();
        } else
        {
            SceneManager.LoadScene(2);
        }
    }

    private void DisplayChoices() 
    {
        //checks if choices are already being displayed
        if (_choiceButtonContainer.GetComponentsInChildren<Button>().Length > 0) return;

        for (int i = 0; i < _story.currentChoices.Count; i++) //iterates through all choices
        {
            var choice = _story.currentChoices[i];
            var button = CreateChoiceButton(choice.text); //creates a choice button
            button.onClick.AddListener(() => OnClickChoiceButton(choice));
        }

    }

    Button CreateChoiceButton(string text)
    {
        //creates the button from a prefab
        var choiceButton = Instantiate(_choiceButtonPrefab);
        choiceButton.transform.SetParent(_choiceButtonContainer.transform, false);

        //sets text on the button
        var buttonText = choiceButton.GetComponentInChildren<TextMeshProUGUI>();
        buttonText.text = text;

        return choiceButton;
    }

    void OnClickChoiceButton(Choice choice) 
    {
        _story.ChooseChoiceIndex(choice.index); // tells ink which choice was selected
        RefreshChoiceView(); //removes choices from the screen
        DisplayNextLine();
    }

    void RefreshChoiceView()
    {
        if (_choiceButtonContainer != null)
        {
            foreach (var button in _choiceButtonContainer.GetComponentsInChildren<Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }

    private void ApplyStyling() 
    {
        if(_story.currentTags.Contains("thought"))
        {
            _textField.color = _thoughtTextColor;
            _textField.fontStyle = FontStyles.Italic;
        }
        else
        {
            _textField.color = _normalTextColor;
            _textField.fontStyle = FontStyles.Normal;
        }
    }

}
