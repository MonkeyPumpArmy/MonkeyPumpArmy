// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Importing OpenZeppelin contracts for ERC20 standard and burnable functionality.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/// @title Monkey Pump ($MNKY) - The primary token of the Monkey Pump ecosystem.
/// @notice $MNKY serves as the main token for the Monkey Pump project, fostering a meme-centric ecosystem.
/// @dev This contract uses OpenZeppelin's ERC20 and ERC20Burnable implementations for secure and reliable token behavior.
/// 
/// @custom:metadata Name: Monkey Pump
/// @custom:metadata Symbol: MNKY
/// @custom:metadata Decimals: 18
/// @custom:metadata Total Supply: 1 Quadrillion (1,000,000,000,000,000 MNKY with 18 decimals)
/// @custom:metadata Contract Address: 0x711D4F0b327F36beeD3FcBBBD19cf04625704A9B
/// @custom:metadata Deployment Date: 25-Jan-2025
/// @custom:metadata Network: Polygon (POL)
/// @custom:metadata Disclaimer: $MNKY is a meme coin with no inherent financial value or guarantees of returns. It is designed solely for entertainment and community engagement.
/// @custom:metadata Logo URI: https://raw.githubusercontent.com/MonkeyPumpArmy/main/assets/mnky-logo.png
/// @custom:metadata Description:
/// - Monkey Pump ($MNKY) is the ultimate community-driven meme coin designed for fun, engagement, and epic pumps to the moon!
/// - It celebrates humor, community, and the joy of being part of a bold movement.
/// - Future expansions, such as lore, NFTs, and $GROG rewards, are planned but not guaranteed.
/// - All project updates and information can be found on our GitHub page.
/// - Please note that any mentioned future expansions are subject to change and are not guaranteed.
/// @custom:metadata GitHub HQ Website (Official Info): https://github.com/MonkeyPumpArmy
/// @custom:metadata Social Media Links: Access all social media and resources here: https://github.com/MonkeyPumpArmy
/// @custom:metadata Tags: Meme Coin, Polygon, ERC-20, Burnable, Community-Driven, Grassroots, Deflationary
/// @custom:metadata Burn Mechanism:
/// - Tokens can be manually burned by any holder to reduce supply and increase scarcity.
/// - Strategic burns may also be conducted manually by the deployer based on community milestones.
/// @custom:metadata Community Incentives: Rewards for participation may include $GROG tokens, NFTs, campaigns, and other initiatives.
/// - These plans are subject to development and are not guaranteed.
/// @custom:metadata Purpose:
/// - $MNKY is the foundation of the Monkey Pump Army’s mission to pump to the moon.
/// - Fostering a meme-centric ecosystem designed for fun and community engagement.
/// - Potential expansions, such as the treasure map game and NFT utilities, are exploratory and contingent on project milestones.
/// @custom:metadata Contact Information: For inquiries or updates, visit our GitHub HQ: https://github.com/MonkeyPumpArmy

contract MonkeyPumpToken is ERC20, ERC20Burnable {
    /// @notice Deploys the Monkey Pump token ($MNKY) and mints the initial supply to the deployer's address.
    /// @dev Initial supply is set to 1 quadrillion (1,000,000,000,000,000) tokens with 18 decimal places.
    /// @dev The token uses 18 decimals, which is standard for ERC-20 tokens.
    constructor() ERC20("Monkey Pump", "MNKY") {
        _mint(msg.sender, 1e15 * 10 ** decimals()); // 1 Quadrillion tokens
    }

    /// @notice Increase the allowance for a spender by a specified amount.
    /// @dev This function helps mitigate front-running issues when increasing allowances.
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, allowance(_msgSender(), spender) + addedValue);
        return true;
    }

    /// @notice Decrease the allowance for a spender by a specified amount.
    /// @dev This function helps mitigate front-running issues when decreasing allowances.
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = allowance(_msgSender(), spender);
        require(currentAllowance >= subtractedValue, "Allowance too low");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        return true;
    }
}
